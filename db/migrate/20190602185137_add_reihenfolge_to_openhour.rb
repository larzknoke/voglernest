class AddReihenfolgeToOpenhour < ActiveRecord::Migration[6.0]
  def change
    add_column :openhours, :reihenfolge, :integer, default: 1
  end
end
