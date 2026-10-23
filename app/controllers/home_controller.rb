class HomeController < ApplicationController
  include ApplicationHelper
  protect_from_forgery except: :fw

  def index
    @openhours = Openhour.all
    @feeds = Feed.all.where.not(deaktiviert: true).sort_by(&:priority).reverse
    respond_to do |format|
      format.html { render layout: 'home/home' }
      format.any { head :not_acceptable }
    end
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
    if params[:start_date].present?
      begin
        Date.parse(params[:start_date].to_s)
      rescue ArgumentError, TypeError
        params.delete(:start_date)
      end
    end
    @calendar_events = Fewo.all.collect(&:bookings).flatten.compact
    render layout: 'home/home'
  end

  def getcalendardates
    calendarDates
    respond_to do |format|
      format.html { }
      format.js { render 'home/getcalendardates'}
    end
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
    #@recaptcha_valid = verify_recaptcha(model: @message, action: 'contact')
    #if @recaptcha_valid && @message.valid?
    if true 
      ContactMailer.contact_email(@message).deliver
      respond_to do |format|
        format.html { redirect_to controller: 'home', action: 'index' }
        format.js { render 'home/contact-form' }
      end
    else
      respond_to do |format|
        format.html { redirect_to controller: 'home', action: 'index' }
        format.js { render 'home/contact-form' }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :telefon, :text)
  end
end
