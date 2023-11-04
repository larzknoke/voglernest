class AddNotizToActsAsBookableBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :acts_as_bookable_bookings, :notiz, :string, default: ""
  end
end
