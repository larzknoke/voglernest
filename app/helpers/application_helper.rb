module ApplicationHelper
  def check(bol)
    if bol
      "<i class='fa fa-check' aria-hidden='true'></i>".html_safe
    else
      "<i class='fa fa-times' aria-hidden='true'></i>".html_safe
    end
  end

  def calendarDates
    require 'net/http'
    begin
      uri = URI(Setting['airvogler_url'])
      @req = Net::HTTP.get(uri)
      @req = JSON.parse(@req)
      @dates = @req.collect{|d| d["date"].to_date}
      @calendar_events = @dates.map{ |date| Event.new(date) }
    rescue StandardError => error
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "+++++++++++++++++++++   ERROR   +++++++++++++++++++++++++++++++"
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts error
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      @calendar_events = []
      false
    end
  end
end
