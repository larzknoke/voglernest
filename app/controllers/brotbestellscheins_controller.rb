class BrotbestellscheinsController < ApplicationController
  before_action :set_brotbestellschein, only: [:show, :edit, :update, :destroy]

  # GET /brotbestellscheins
  # GET /brotbestellscheins.json
  def index
    @brotbestellscheins = Brotbestellschein.all
  end

  # GET /brotbestellscheins/1
  # GET /brotbestellscheins/1.json
  def show
  end

  # GET /brotbestellscheins/new
  def new
    @brotbestellschein = Brotbestellschein.new
  end

  # GET /brotbestellscheins/1/edit
  def edit
  end

  # POST /brotbestellscheins
  # POST /brotbestellscheins.json
  def create

    @datum = params[:datum].to_datetime
    @bsts = Brotbestellung.where(:datum => @datum, :brotbestellschein => nil)

    if @bsts.size < 1
      flash[:notice] = "Keine offenen Bestellungen für diesen Zeitraum vorhanden."
      return redirect_to brotbestellungs_path
    end

    if Brotbestellschein.find_by(datum: @datum)
      @brotbestellschein = Brotbestellschein.find_by(datum: @datum)
      @brotbestellschein.brotbestellungs << @bsts
    else
      @brotbestellschein = Brotbestellschein.new(brotbestellschein_params)
      @brotbestellschein.brotbestellungs << @bsts
    end

    @brotbestellschein.datum = @datum

    respond_to do |format|
      if @brotbestellschein.save
        format.html { redirect_to @brotbestellschein, notice: 'Brotbestellschein was successfully created.' }
        format.json { render :show, status: :created, location: @brotbestellschein }
      else
        format.html { render :new }
        format.json { render json: @brotbestellschein.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brotbestellscheins/1
  # PATCH/PUT /brotbestellscheins/1.json
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

  # DELETE /brotbestellscheins/1
  # DELETE /brotbestellscheins/1.json
  def destroy
    @brotbestellschein.destroy
    respond_to do |format|
      format.html { redirect_to brotbestellscheins_url, notice: 'Brotbestellschein was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def bestellemail
    @bestellschein = Brotbestellschein.find(params[:id])
    BestellMailer.bestell_email(@bestellschein).deliver_now
    render plain: "Email send!"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotbestellschein
      @brotbestellschein = Brotbestellschein.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotbestellschein_params
      params.fetch(:brotbestellschein, {})
    end
end
