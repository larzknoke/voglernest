class BookingsController < ApplicationController
  def index
    # @bookings = Fewo.all.collect(&:bookings).flatten
    @bookings = all_bookings
    # @bookings = Fewo.joins(:bookings)
  end

  def new

  end

  def create
    @mieter = Mieter.find(params[:mieter_id])
    @anzahl = params[:capacity].to_i
    @fewo = Fewo.find(params[:fewo_id])
    @check_in = Time.zone.parse(params[:check_in]).change(hour: 15)
    @check_out = Time.zone.parse(params[:check_out]).change(hour: 11)

    begin
      @mieter.book! @fewo, time_start: @check_in, time_end: @check_out, amount: @anzahl
    rescue ActsAsBookable::AvailabilityError
      flash[:notice] = "Reservierung in diesem Zeitraum nicht möglich!"
      redirect_to new_booking_path
      return
    # rescue
      # # flash[:notice] = "Reservierung konnte nicht angelegt werden!"
      # redirect_to booking_new_path
    end
    redirect_to bookings_path


  end

  def update
  end

  def destroy
    id = params[:id].to_i
    booking = booking(id)
    if booking.present?
      if booking.destroy
        flash[:notice] = "Reservierung erfolgreich gelöscht!"
      else
        flash[:notice] = "Reservierung konnte nicht gelöscht werden!"
      end
    else
      flash[:notice] = "Keine Reservierung mit dieser ID gefunden!"
    end
    redirect_to bookings_path
  end


  def bestaetigen
    id = params[:id].to_i
    booking = booking(id)

    booking.bestaetigt = true
    booking.save
    redirect_to bookings_path

  end


  private
  def booking(id)
    Fewo.all.collect{|f| f.bookings.collect{|b| b if b.id == id}}.flatten.compact.last
  end

  def all_bookings
    Fewo.all.collect(&:bookings).flatten.compact
  end

  def all_bookings_bestaetigt
    Fewo.all.collect{|f| f.bookings.collect{|b| b if b.bestaetigt == true}}.flatten.compact
  end

end
