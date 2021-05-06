class BestellungsController < ApplicationController
  before_action :set_bestellung, only: %i[ show edit update destroy ]

  # GET /bestellungs or /bestellungs.json
  def index
    @bestellungs = Bestellung.all
  end

  # GET /bestellungs/1 or /bestellungs/1.json
  def show
  end

  # GET /bestellungs/new
  def new
    @bestellung = Bestellung.new
  end

  # GET /bestellungs/1/edit
  def edit
  end

  # POST /bestellungs or /bestellungs.json
  def create
    @bestellung = Bestellung.new(bestellung_params)

    respond_to do |format|
      if @bestellung.save
        format.html { redirect_to @bestellung, notice: "Bestellung was successfully created." }
        format.json { render :show, status: :created, location: @bestellung }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bestellung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bestellungs/1 or /bestellungs/1.json
  def update
    respond_to do |format|
      if @bestellung.update(bestellung_params)
        format.html { redirect_to @bestellung, notice: "Bestellung was successfully updated." }
        format.json { render :show, status: :ok, location: @bestellung }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bestellung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bestellungs/1 or /bestellungs/1.json
  def destroy
    @bestellung.destroy
    respond_to do |format|
      format.html { redirect_to bestellungs_url, notice: "Bestellung was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bestellung
      @bestellung = Bestellung.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bestellung_params
      params.require(:bestellung).permit(:status, :abholdatum, :zahlungsmethode, :bezahlt, :abgeholt, :noitz, :total, :user_id)
    end
end
