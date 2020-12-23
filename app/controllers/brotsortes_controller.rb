class BrotsortesController < ApplicationController
  before_action :set_brotsorte, only: [:show, :edit, :update, :destroy]
  before_action :authorize


  # GET /brotsortes
  # GET /brotsortes.json
  def index
    @brotsortes = Brotsorte.all
  end

  # GET /brotsortes/1
  # GET /brotsortes/1.json
  def show
  end

  # GET /brotsortes/new
  def new
    @brotsorte = Brotsorte.new
  end

  # GET /brotsortes/1/edit
  def edit
  end

  # POST /brotsortes
  # POST /brotsortes.json
  def create
    @brotsorte = Brotsorte.new(brotsorte_params)

    respond_to do |format|
      if @brotsorte.save
        format.html { redirect_to @brotsorte, notice: 'Brotsorte was successfully created.' }
        format.json { render :show, status: :created, location: @brotsorte }
      else
        format.html { render :new }
        format.json { render json: @brotsorte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brotsortes/1
  # PATCH/PUT /brotsortes/1.json
  def update
    respond_to do |format|
      if @brotsorte.update(brotsorte_params)
        format.html { redirect_to @brotsorte, notice: 'Brotsorte was successfully updated.' }
        format.json { render :show, status: :ok, location: @brotsorte }
      else
        format.html { render :edit }
        format.json { render json: @brotsorte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brotsortes/1
  # DELETE /brotsortes/1.json
  def destroy
    @brotsorte.destroy
    respond_to do |format|
      format.html { redirect_to brotsortes_url, notice: 'Brotsorte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotsorte
      @brotsorte = Brotsorte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotsorte_params
      params.require(:brotsorte).permit(:name, :aktiv, :ausverkauft, :brottyp_id, :brotbild)
    end
end
