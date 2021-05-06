class CreateBrotsortes < ActiveRecord::Migration[6.0]
  def change
    create_table :brotsortes do |t|
      t.string :name
      t.boolean :aktiv
      t.boolean :ausverkauft
      t.references :brottyp, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
