class CreateWarenkorbpositions < ActiveRecord::Migration[6.0]
  def change
    create_table :warenkorbpositions do |t|
      t.integer :menge
      t.references :warenkorb, null: false, foreign_key: true
      t.references :produkt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
