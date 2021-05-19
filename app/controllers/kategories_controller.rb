class KategoriesController < ApplicationController
  before_action :set_kategory, only: %i[ show edit update destroy ]

  # GET /kategories or /kategories.json
  def index
    @kategories = Kategorie.all
  end

  # GET /kategories/1 or /kategories/1.json
  def show
  end

  # GET /kategories/new
  def new
    @kategory = Kategorie.new
  end

  # GET /kategories/1/edit
  def edit
  end

  # POST /kategories or /kategories.json
  def create
    @kategory = Kategorie.new(kategory_params)

    respond_to do |format|
      if @kategory.save
        format.html { redirect_to @kategory, notice: "Kategorie was successfully created." }
        format.json { render :show, status: :created, location: @kategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kategories/1 or /kategories/1.json
  def update
    respond_to do |format|
      if @kategory.update(kategory_params)
        format.html { redirect_to @kategory, notice: "Kategorie was successfully updated." }
        format.json { render :show, status: :ok, location: @kategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kategories/1 or /kategories/1.json
  def destroy
    @kategory.destroy
    respond_to do |format|
      format.html { redirect_to kategories_url, notice: "Kategorie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kategory
      @kategory = Kategorie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kategory_params
      params.require(:kategorie).permit(:name, :aktiv)
    end
end
