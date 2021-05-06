class CreateProdukts < ActiveRecord::Migration[6.0]
  def change
    create_table :produkts do |t|
      t.string :name
      t.boolean :aktiv
      t.boolean :ausverkauft
      t.float :preis
      t.references :kategorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
