class HomeController < ApplicationController
  def index
    @openhours = Openhour.all
    render layout: 'home/home'
  end

  def hof
    render layout: 'home/home'
  end

  def biogas
    render layout: 'home/home'
  end

  def ausbildung
    render layout: 'home/home'
  end

  def fw
    render layout: 'home/home'
  end

  def hofladen
    @openhours = Openhour.all
    render layout: 'home/home'
  end

  def thanks
    render layout: 'home/home'
  end

end
