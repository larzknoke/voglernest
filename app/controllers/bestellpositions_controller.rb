class BestellpositionsController < ApplicationController
  before_action :set_bestellposition, only: %i[ show edit update destroy ]

  # GET /bestellpositions or /bestellpositions.json
  def index
    @bestellpositions = Bestellposition.all
  end

  # GET /bestellpositions/1 or /bestellpositions/1.json
  def show
  end

  # GET /bestellpositions/new
  def new
    @bestellposition = Bestellposition.new
  end

  # GET /bestellpositions/1/edit
  def edit
  end

  # POST /bestellpositions or /bestellpositions.json
  def create
    @bestellposition = Bestellposition.new(bestellposition_params)

    respond_to do |format|
      if @bestellposition.save
        format.html { redirect_to @bestellposition, notice: "Bestellposition was successfully created." }
        format.json { render :show, status: :created, location: @bestellposition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bestellposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bestellpositions/1 or /bestellpositions/1.json
  def update
    respond_to do |format|
      if @bestellposition.update(bestellposition_params)
        format.html { redirect_to @bestellposition, notice: "Bestellposition was successfully updated." }
        format.json { render :show, status: :ok, location: @bestellposition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bestellposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bestellpositions/1 or /bestellpositions/1.json
  def destroy
    @bestellposition.destroy
    respond_to do |format|
      format.html { redirect_to bestellpositions_url, notice: "Bestellposition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bestellposition
      @bestellposition = Bestellposition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bestellposition_params
      params.require(:bestellposition).permit(:menge, :preis, :bestellung_id)
    end
end
