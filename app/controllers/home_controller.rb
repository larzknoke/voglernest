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
    require 'net/http'
    begin
      uri = URI('http://localhost:3000/calendar/14756501')
      @req = Net::HTTP.get(uri)
      @req = JSON.parse(@req)
      @dates = @req.collect{|d| d["date"].to_date}
      @calendar_events = @dates.map{ |date| Event.new(date) }
    rescue StandardError
      @calendar_events = []
      false
    end


    render layout: 'home/home'
  end

  def hofladen
    @openhours = Openhour.all
    render layout: 'home/home'
  end

  def kontakt
    @openhours = Openhour.all
    render layout: 'home/home'
  end

  def thanks
    render layout: 'home/home'
  end


  def contactmail
    @message = Message.new(message_params)
    if @message.valid?
      puts 'fine!'
      ContactMailer.contact_email(@message).deliver
      respond_to do |format|
        format.html { redirect_to :controller => 'home', :action => 'index' }
        format.js { render 'home/contact-form'}
      end
    else
      puts "err!"
      respond_to do |format|
        format.html { redirect_to :controller => 'home', :action => 'index' }
        format.js { render 'home/contact-form'}
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :telefon, :text)
  end

end
