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
      redirect_to mieters_url
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

  def update
  end

  private

  def mieter_params
    params.require(:mieter).permit!
  end
end
