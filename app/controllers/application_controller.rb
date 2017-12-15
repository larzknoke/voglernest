class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def datumsbereich
    # hole mir alle Di, Fr und Sa für die nächsten 4 Wochen
    start_date = DateTime.now.hour <= 11 ? Date.today + 1.day : Date.today + 2.day
    end_date = Date.today + 1.month
    my_days = [2,5,6]
    @date_result = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}
    @date_result = @date_result.map{ |date| l(date, format: "%a, %d.%m.%Y") }
  end
end
