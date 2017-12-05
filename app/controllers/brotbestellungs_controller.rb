class BrotbestellungsController < ApplicationController
  before_action :set_brotbestellung, only: [:show, :edit, :update, :destroy]

  # GET /brotbestellungs
  # GET /brotbestellungs.json
  def index
    @brotbestellungs = Brotbestellung.all
  end

  # GET /brotbestellungs/1
  # GET /brotbestellungs/1.json
  def show
  end

  # GET /brotbestellungs/new
  def new
    @brotbestellung = Brotbestellung.new
    @brotbestellung.brotbestellposi.build
    @brotsorten = Brotsorte.where(aktiv: true)

    datumsbereich

    render layout: 'home/home'
  end

  # GET /brotbestellungs/1/edit
  def edit
    datumsbereich
  end

  # POST /brotbestellungs
  # POST /brotbestellungs.json
  def create
    @brotbestellung = Brotbestellung.new(brotbestellung_params)

    respond_to do |format|
      if @brotbestellung.save
        format.html { redirect_to @brotbestellung, notice: 'Brotbestellung was successfully created.' }
        format.json { render :show, status: :created, location: @brotbestellung }
      else
        format.html { render :new }
        format.json { render json: @brotbestellung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brotbestellungs/1
  # PATCH/PUT /brotbestellungs/1.json
  def update
    respond_to do |format|
      if @brotbestellung.update(brotbestellung_params)
        format.html { redirect_to @brotbestellung, notice: 'Brotbestellung was successfully updated.' }
        format.json { render :show, status: :ok, location: @brotbestellung }
      else
        format.html { render :edit }
        format.json { render json: @brotbestellung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brotbestellungs/1
  # DELETE /brotbestellungs/1.json
  def destroy
    @brotbestellung.destroy
    respond_to do |format|
      format.html { redirect_to brotbestellungs_url, notice: 'Brotbestellung was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotbestellung
      @brotbestellung = Brotbestellung.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotbestellung_params
      params.require(:brotbestellung).permit(:vorname, :name, :telefon, :email, :datum, :brotbestellposi_id,brotbestellposi_attributes: [:menge, :brotsorte_id])
    end

    def datumsbereich
      # hole mir alle Di, Fr und Sa für die nächsten 4 Wochen
      start_date = DateTime.now.hour <= 11 ? Date.today + 1.day : Date.today + 2.day
      end_date = Date.today + 1.month
      my_days = [2,5,6]
      @date_result = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}
      @date_result = @date_result.map{ |date| l(date, format: "%a, %d.%m.%Y") }
    end


end
