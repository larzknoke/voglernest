class AddTypToActsAsBookableBookings < ActiveRecord::Migration
  def change
    add_column :acts_as_bookable_bookings, :typ, :string, default: "std"
  end
end
