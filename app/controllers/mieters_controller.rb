class MietersController < ApplicationController
  before_filter :authorize


  def index
    @mieters = Mieter.all
  end

  def show

  end

  def new
    @mieter = Mieter.new
  end

  def create
    @mieter = Mieter.new(mieter_params)
    if @mieter.save
      respond_to do |format|
        format.html { redirect_to mieters_url, notice: 'Mieter erstellt!' }
        format.json { render json: @mieter }
      end
    else
      render 'new'
    end
  end

  def destroy
    @mieter = Mieter.find(params[:id])
    @mieter.destroy
    respond_to do |format|
      format.html { redirect_to mieters_url, notice: 'Mieter gelöscht!' }
      format.json { head :no_content }
    end
  end

  def edit
    @mieter = Mieter.find(params[:id])
  end

  def update
    @mieter = Mieter.find(params[:id])
    respond_to do |format|
      if @mieter.update(mieter_params)
        format.html { redirect_to mieters_path, notice: 'Mieter erfolgreich gespeichert.' }
        format.json { render :show, status: :ok, location: @mieter }
      else
        format.html { render :edit }
        format.json { render json: @mieter.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def mieter_params
    params.require(:mieter).permit!
  end
end
