class ProduktsController < ApplicationController
  before_action :set_produkt, only: %i[ show edit update destroy ]

  # GET /produkts or /produkts.json
  def index
    @produkts = Produkt.all
  end

  # GET /produkts/1 or /produkts/1.json
  def show
  end

  # GET /produkts/new
  def new
    @produkt = Produkt.new
  end

  # GET /produkts/1/edit
  def edit
  end

  # POST /produkts or /produkts.json
  def create
    @produkt = Produkt.new(produkt_params)

    respond_to do |format|
      if @produkt.save
        format.html { redirect_to @produkt, notice: "Produkt erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @produkt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produkt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produkts/1 or /produkts/1.json
  def update
    respond_to do |format|
      if @produkt.update(produkt_params)
        format.html { redirect_to @produkt, notice: "Produkt erfolgreich geändert." }
        format.json { render :show, status: :ok, location: @produkt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produkt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produkts/1 or /produkts/1.json
  def destroy
    @produkt.destroy
    respond_to do |format|
      format.html { redirect_to produkts_url, notice: "Produkt erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produkt
      @produkt = Produkt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produkt_params
      params.require(:produkt).permit(:name, :aktiv, :ausverkauft, :preis, :warenkorbposition_id, :bestellposition_id, :produktbild, :kategorie_id)
    end
end
