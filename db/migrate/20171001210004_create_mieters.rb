class CreateMieters < ActiveRecord::Migration
  def change
    create_table :mieters do |t|
      t.string :name
      t.string :vorname
      t.string :telefon
      t.string :email
      t.string :strasse
      t.integer :plz
      t.string :ort

      t.timestamps null: false
    end
  end
end
