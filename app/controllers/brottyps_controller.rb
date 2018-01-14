class BrottypsController < ApplicationController
  before_action :set_brottyp, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /brottyps
  # GET /brottyps.json
  def index
    @brottyps = Brottyp.all
  end

  # GET /brottyps/1
  # GET /brottyps/1.json
  def show
  end

  # GET /brottyps/new
  def new
    @brottyp = Brottyp.new
  end

  # GET /brottyps/1/edit
  def edit
  end

  # POST /brottyps
  # POST /brottyps.json
  def create
    @brottyp = Brottyp.new(brottyp_params)

    respond_to do |format|
      if @brottyp.save
        format.html { redirect_to @brottyp, notice: 'Brottyp was successfully created.' }
        format.json { render :show, status: :created, location: @brottyp }
      else
        format.html { render :new }
        format.json { render json: @brottyp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brottyps/1
  # PATCH/PUT /brottyps/1.json
  def update
    respond_to do |format|
      if @brottyp.update(brottyp_params)
        format.html { redirect_to @brottyp, notice: 'Brottyp was successfully updated.' }
        format.json { render :show, status: :ok, location: @brottyp }
      else
        format.html { render :edit }
        format.json { render json: @brottyp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brottyps/1
  # DELETE /brottyps/1.json
  def destroy
    @brottyp.destroy
    respond_to do |format|
      format.html { redirect_to brottyps_url, notice: 'Brottyp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brottyp
      @brottyp = Brottyp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brottyp_params
      params.require(:brottyp).permit(:name)
    end
end
