class MietersController < ApplicationController
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
      redirect_to @mieter
    else
      render 'new'
    end
  end

  def update
  end

  private

  def mieter_params
    params.require(:mieter).permit!
  end
end
