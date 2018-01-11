class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :datumsbereich_30

  def datumsbereich_30
    # hole mir alle Di, Fr und Sa für die nächsten 4 Wochen
    start_date = DateTime.now.hour <= 11 ? Date.current + 1.day : Date.current + 2.day
    end_date = Date.current + 1.month
    days = [2,5,6]
    @date_result = (start_date..end_date).to_a.select {|k| days.include?(k.wday)}
    @date_result = @date_result.map{ |date| l(date, format: "%a, %d.%m.%Y") }
  end

end
