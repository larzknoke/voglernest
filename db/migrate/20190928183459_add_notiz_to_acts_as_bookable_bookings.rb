class AddNotizToActsAsBookableBookings < ActiveRecord::Migration
  def change
    add_column :acts_as_bookable_bookings, :notiz, :string, default: ""
  end
end
