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
