class ErrorsController < ApplicationController
  def error_404
    render 'errors/not_found', layout: false
  end
end
