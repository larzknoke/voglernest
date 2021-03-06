class BrotbestellscheinsController < ApplicationController
  before_action :set_brotbestellschein, only: [:show, :edit, :update, :destroy]
  before_action :authorize


  def index
    @brotbestellscheins = Brotbestellschein.all
  end

  def show
    @brotsorten = Brotsorte.where(aktiv: true)
    @brotbestellung = Brotbestellung.new
    @brotbestellung.brotbestellposi.build
  end

  def new
    @brotbestellschein = Brotbestellschein.new
    datumsbereich_30
  end

  def edit
  end

  def create
    @datum = params[:brotbestellschein][:datum].to_time.to_datetime
    if Brotbestellschein.find_by(datum: @datum)
      @brotbestellschein = Brotbestellschein.find_by(datum: @datum)
      return redirect_to @brotbestellschein, notice: 'Brotbestellschein existiert bereits.'
    else
      @brotbestellschein = Brotbestellschein.new(brotbestellschein_params)
    end


    respond_to do |format|
      if @brotbestellschein.save
        format.html { redirect_to @brotbestellschein, notice: 'Brotbestellschein wurde erstellt.' }
        format.json { render :show, status: :created, location: @brotbestellschein }
      else
        format.html { render :new }
        format.json { render json: @brotbestellschein.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @brotbestellschein.update(brotbestellschein_params)
        format.html { redirect_to @brotbestellschein, notice: 'Brotbestellschein was successfully updated.' }
        format.json { render :show, status: :ok, location: @brotbestellschein }
      else
        format.html { render :edit }
        format.json { render json: @brotbestellschein.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brotbestellschein.brotbestellungs.where(typ: "zusatz").destroy_all
    @brotbestellschein.brotbestellungs.where("typ like ?", "%standard%").destroy_all
    @brotbestellschein.brotbestellungs.each{|b| b.update_attribute(:brotbestellschein_id, nil)}
    @brotbestellschein.destroy
    respond_to do |format|
      format.html { redirect_to brotbestellscheins_url, notice: 'Brotbestellschein was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def bestellemail
    @bestellschein = Brotbestellschein.find(params[:id])
    @bestellschein.versendet = DateTime.now
    @bestellschein.save

    BestellMailer.bestell_email(@bestellschein).deliver_now
    flash[:notice] = "Bestellung versendet."

    redirect_to @bestellschein
  end

  def bst_auf_schein
    @brotbestellschein = Brotbestellschein.find(params[:id])

    @bst = Brotbestellung.new(brotbestellung_params)
    @bst.datum = @brotbestellschein.datum
    @brotbestellschein.brotbestellungs << @bst
    @brotbestellschein.save

    redirect_to @brotbestellschein
  end


  def schein_aus_bst
    @datum = params[:datum].to_datetime
    @datum_tag = params[:datum].to_datetime.wday
    @bsts = Brotbestellung.where(:datum => @datum, :brotbestellschein => nil, :typ => "bestellung")

    if @bsts.size < 1
      flash[:notice] = "Keine offenen Bestellungen für diesen Zeitraum vorhanden."
      return redirect_to brotbestellungs_path
    end

    if Brotbestellschein.find_by_datum_and_versendet(@datum, nil)
      @brotbestellschein = Brotbestellschein.find_by_datum_and_versendet(@datum, nil)
      @brotbestellschein.brotbestellungs << @bsts
    else
      @brotbestellschein = Brotbestellschein.new(brotbestellschein_params)
      @brotbestellschein.brotbestellungs << @bsts
        case @datum_tag
        when 2
          @std_bst = Brotbestellung.find_by(:typ => "standard_di")
        when 5
          @std_bst = Brotbestellung.find_by(:typ => "standard_fr")
        when 6
          @std_bst = Brotbestellung.find_by(:typ => "standard_sa")
        end

        if @std_bst
          # dupliziere Standard
          @new_std_bst = @std_bst.amoeba_dup
          @new_std_bst.datum = @datum
          case @datum_tag
          when 2
            @new_std_bst.typ = "standard_di_auf_schein"
          when 5
            @new_std_bst.typ = "standard_fr_auf_schein"
          when 6
            @new_std_bst.typ = "standard_sa_auf_schein"
          end
          @new_std_bst.save
          @brotbestellschein.brotbestellungs << @new_std_bst
        end
    end

    @brotbestellschein.datum = @datum

    respond_to do |format|
      if @brotbestellschein.save
        format.html { redirect_to @brotbestellschein, notice: 'Brotbestellschein wurde erstellt.' }
        format.json { render :show, status: :created, location: @brotbestellschein }
      else
        format.html { render :new }
        format.json { render json: @brotbestellschein.errors, status: :unprocessable_entity }
      end
    end
  end

  def packzettel_show
    @datum = params[:datum].to_date
    @brotbestellungs = Brotbestellung.all.find_all{|b| b.versendet && b.datum == params[:datum] && b.typ == "bestellung"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotbestellschein
      @brotbestellschein = Brotbestellschein.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotbestellschein_params
      params.permit(:datum)
    end
    def brotbestellung_params
      params.require(:brotbestellung).permit(:vorname, :name, :telefon, :email, :datum, :typ ,:brotbestellposi_id, brotbestellposi_attributes: [:menge, :brotsorte_id])
    end
end
