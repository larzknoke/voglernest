class WarenkorbsController < ApplicationController
  before_action :set_warenkorb, only: %i[ show edit update destroy ]

  # GET /warenkorbs or /warenkorbs.json
  def index
    @warenkorbs = Warenkorb.all
  end

  # GET /warenkorbs/1 or /warenkorbs/1.json
  def show
  end

  # GET /warenkorbs/new
  def new
    @warenkorb = Warenkorb.new
  end

  # GET /warenkorbs/1/edit
  def edit
  end

  # POST /warenkorbs or /warenkorbs.json
  def create
    @warenkorb = Warenkorb.new(warenkorb_params)

    respond_to do |format|
      if @warenkorb.save
        format.html { redirect_to @warenkorb, notice: "Warenkorb was successfully created." }
        format.json { render :show, status: :created, location: @warenkorb }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warenkorb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warenkorbs/1 or /warenkorbs/1.json
  def update
    respond_to do |format|
      if @warenkorb.update(warenkorb_params)
        format.html { redirect_to @warenkorb, notice: "Warenkorb was successfully updated." }
        format.json { render :show, status: :ok, location: @warenkorb }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warenkorb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warenkorbs/1 or /warenkorbs/1.json
  def destroy
    @warenkorb.destroy
    respond_to do |format|
      format.html { redirect_to warenkorbs_url, notice: "Warenkorb was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warenkorb
      @warenkorb = Warenkorb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warenkorb_params
      params.require(:warenkorb).permit(:gutschein, :abholdatum, :gast, :notiz, :user_id)
    end
end
