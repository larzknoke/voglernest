class AddReihenfolgeToOpenhour < ActiveRecord::Migration
  def change
    add_column :openhours, :reihenfolge, :integer, default: 1
  end
end
