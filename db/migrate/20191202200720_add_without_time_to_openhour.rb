class AddWithoutTimeToOpenhour < ActiveRecord::Migration[6.0]
  def change
    add_column :openhours, :without_time, :boolean, :default => false
  end
end
