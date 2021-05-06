class AddTypToActsAsBookableBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :acts_as_bookable_bookings, :typ, :string, default: "std"
  end
end
