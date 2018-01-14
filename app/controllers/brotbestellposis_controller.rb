class BrotbestellposisController < ApplicationController
  before_action :set_brotbestellposi, only: [:show, :edit, :update, :destroy]
  before_filter :authorize


  # GET /brotbestellposis
  # GET /brotbestellposis.json
  def index
    @brotbestellposis = Brotbestellposi.all
  end

  # GET /brotbestellposis/1
  # GET /brotbestellposis/1.json
  def show
  end

  # GET /brotbestellposis/new
  def new
    @brotbestellposi = Brotbestellposi.new
  end

  # GET /brotbestellposis/1/edit
  def edit
  end

  # POST /brotbestellposis
  # POST /brotbestellposis.json
  def create
    @brotbestellposi = Brotbestellposi.new(brotbestellposi_params)

    respond_to do |format|
      if @brotbestellposi.save
        format.html { redirect_to @brotbestellposi, notice: 'Brotbestellposi was successfully created.' }
        format.json { render :show, status: :created, location: @brotbestellposi }
      else
        format.html { render :new }
        format.json { render json: @brotbestellposi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brotbestellposis/1
  # PATCH/PUT /brotbestellposis/1.json
  def update
    respond_to do |format|
      if @brotbestellposi.update(brotbestellposi_params)
        format.html { redirect_to @brotbestellposi, notice: 'Brotbestellposi was successfully updated.' }
        format.json { render :show, status: :ok, location: @brotbestellposi }
      else
        format.html { render :edit }
        format.json { render json: @brotbestellposi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brotbestellposis/1
  # DELETE /brotbestellposis/1.json
  def destroy
    @brotbestellposi.destroy
    respond_to do |format|
      format.html { redirect_to brotbestellposis_url, notice: 'Brotbestellposi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brotbestellposi
      @brotbestellposi = Brotbestellposi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brotbestellposi_params
      params.require(:brotbestellposi).permit(:menge, :brotsorte_id, :brotbestellung_id)
    end
end
