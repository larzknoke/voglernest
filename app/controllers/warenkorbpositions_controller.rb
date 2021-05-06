class WarenkorbpositionsController < ApplicationController
  before_action :set_warenkorbposition, only: %i[ show edit update destroy ]

  # GET /warenkorbpositions or /warenkorbpositions.json
  def index
    @warenkorbpositions = Warenkorbposition.all
  end

  # GET /warenkorbpositions/1 or /warenkorbpositions/1.json
  def show
  end

  # GET /warenkorbpositions/new
  def new
    @warenkorbposition = Warenkorbposition.new
  end

  # GET /warenkorbpositions/1/edit
  def edit
  end

  # POST /warenkorbpositions or /warenkorbpositions.json
  def create
    @warenkorbposition = Warenkorbposition.new(warenkorbposition_params)

    respond_to do |format|
      if @warenkorbposition.save
        format.html { redirect_to @warenkorbposition, notice: "Warenkorbposition was successfully created." }
        format.json { render :show, status: :created, location: @warenkorbposition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warenkorbposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warenkorbpositions/1 or /warenkorbpositions/1.json
  def update
    respond_to do |format|
      if @warenkorbposition.update(warenkorbposition_params)
        format.html { redirect_to @warenkorbposition, notice: "Warenkorbposition was successfully updated." }
        format.json { render :show, status: :ok, location: @warenkorbposition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warenkorbposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warenkorbpositions/1 or /warenkorbpositions/1.json
  def destroy
    @warenkorbposition.destroy
    respond_to do |format|
      format.html { redirect_to warenkorbpositions_url, notice: "Warenkorbposition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warenkorbposition
      @warenkorbposition = Warenkorbposition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warenkorbposition_params
      params.require(:warenkorbposition).permit(:menge, :warenkorb_id)
    end
end
