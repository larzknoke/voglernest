class HomeController < ApplicationController
  def index
    render layout: 'home/home'
  end
end
