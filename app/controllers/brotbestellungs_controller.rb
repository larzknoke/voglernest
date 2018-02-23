class BrotbestellungsController < ApplicationController
  before_action :set_brotbestellung, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, except: [:new, :create]

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

    datumsbereich_30

    render layout: 'home/home'
  end

  # GET /brotbestellungs/1/edit
  def edit
    datumsbereich_30
  end

  # POST /brotbestellungs
  # POST /brotbestellungs.json
  def create
    @brotbestellung = Brotbestellung.new(brotbestellung_params)
    # if @brotbestellung.brotbestellposi.size == 0
    #   return redirect_to new_brotbestellung_url, notice: 'Ihre Bestellung hat keine Bestellpositionen.'
    # end

    respond_to do |format|
      if @brotbestellung.save
        format.html { redirect_to home_thanks_path, notice: 'Brotbestellung was successfully created.' }
        format.json { render :show, status: :created, location: @brotbestellung }
      else
        format.html { redirect_to new_brotbestellung_path, alert: @brotbestellung.errors.full_messages }
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


  def standard
    @brotbestellung = Brotbestellung.find_by(typ: "standard", :datum => nil)
    if @brotbestellung == nil
      @brotbestellung = Brotbestellung.new
      @brotbestellung.brotbestellposi.build
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotbestellung
      @brotbestellung = Brotbestellung.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotbestellung_params
      params.require(:brotbestellung).permit(:vorname, :name, :telefon, :email, :datum, :typ, :brotbestellposi_id,brotbestellposi_attributes: [:id, :menge, :brotsorte_id, :_destroy])
      # params.require(:brotbestellung).permit!
    end


end
