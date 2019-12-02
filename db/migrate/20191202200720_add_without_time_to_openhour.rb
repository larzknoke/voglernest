class AddWithoutTimeToOpenhour < ActiveRecord::Migration
  def change
    add_column :openhours, :without_time, :boolean, :default => false
  end
end
