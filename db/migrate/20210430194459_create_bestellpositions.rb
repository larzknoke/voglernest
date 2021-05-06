class CreateBestellpositions < ActiveRecord::Migration[6.0]
  def change
    create_table :bestellpositions do |t|
      t.integer :menge
      t.float :preis
      t.references :bestellung, null: false, foreign_key: true
      t.references :produkt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
