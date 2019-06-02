class OpenhoursController < ApplicationController
  before_action :set_openhour, only: [:show, :edit, :update, :destroy]
  before_filter :authorize


  # GET /openhours
  # GET /openhours.json
  def index
    @openhours = Openhour.all
  end

  # GET /openhours/1
  # GET /openhours/1.json
  def show
  end

  # GET /openhours/new
  def new
    @openhour = Openhour.new
  end

  # GET /openhours/1/edit
  def edit
  end

  # POST /openhours
  # POST /openhours.json
  def create
    @openhour = Openhour.new(openhour_params)

    respond_to do |format|
      if @openhour.save
        format.html { redirect_to openhours_url, notice: 'Openhour was successfully created.' }
        format.json { render :show, status: :created, location: @openhour }
      else
        format.html { render :new }
        format.json { render json: @openhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openhours/1
  # PATCH/PUT /openhours/1.json
  def update
    respond_to do |format|
      if @openhour.update(openhour_params)
        format.html { redirect_to openhours_url, notice: 'Openhour was successfully updated.' }
        format.json { render :show, status: :ok, location: @openhour }
      else
        format.html { render :edit }
        format.json { render json: @openhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openhours/1
  # DELETE /openhours/1.json
  def destroy
    @openhour.destroy
    respond_to do |format|
      format.html { redirect_to openhours_url, notice: 'Openhour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_openhour
      @openhour = Openhour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def openhour_params
      params.require(:openhour).permit(:tag, :start, :ende, :spezial, :geschlossen, :reihenfolge)
    end
end
