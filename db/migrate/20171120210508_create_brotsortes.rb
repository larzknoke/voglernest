class CreateBrotsortes < ActiveRecord::Migration
  def change
    create_table :brotsortes do |t|
      t.string :name
      t.boolean :aktiv
      t.boolean :ausverkauft

      t.timestamps null: false
    end
  end
end
