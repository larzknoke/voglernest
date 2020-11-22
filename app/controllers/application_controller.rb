class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :datumsbereich_30
  helper_method :current_user


  def datumsbereich_30
    # hole mir alle Di, Fr und Sa für die nächsten 4 Wochen
    start_date = DateTime.now.hour <= 11 ? Date.current + 1.day : Date.current + 2.day
    end_date = Date.current + 1.month
    days = [2,5,6]
    @date_result = (start_date..end_date).to_a.select {|k| days.include?(k.wday)}
    @date_result = @date_result.map{ |date| l(date, format: "%a, %d.%m.%Y") }
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError,      with: -> { render_404  }
    rescue_from ActionController::UnknownController, with: -> { render_404  }
    rescue_from ActionController::UnknownFormat,     with: -> { render_404  }
    rescue_from ActiveRecord::RecordNotFound,        with: -> { render_404  }
    rescue_from ActionView::MissingTemplate,         with: -> { render_404  }
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404, layout: false }
      format.all { render nothing: true, status: 404 }
    end
  end

end
