class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :vorname, :string
    add_column :users, :telefon, :string
    add_column :users, :strasse, :string
    add_column :users, :plz, :integer
    add_column :users, :ort, :string
    add_column :users, :gast, :boolean
    add_column :users, :admin, :boolean
  end
end
