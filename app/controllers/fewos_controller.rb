class FewosController < ApplicationController
  def index
    @fewos = Fewo.all
  end

  def new
    @fewo = Fewo.new
  end

  def create
    @fewo = Fewo.new(fewo_params)
    @fewo.schedule = IceCube::Schedule.new(Time.current, duration: 1.day)
    # @fewo.schedule.add_recurrence_rule IceCube::Rule.weekly.day(:friday,:saturday,:sunday)
    @fewo.schedule.add_recurrence_rule IceCube::Rule.daily

    if @fewo.save!
      redirect_to fewos_path
    else
      render 'new'
    end
  end

  def update
  end


  private

  def fewo_params
    params.require(:fewo).permit!
  end
end
