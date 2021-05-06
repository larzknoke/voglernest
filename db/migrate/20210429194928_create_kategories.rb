class CreateKategories < ActiveRecord::Migration[6.0]
  def change
    create_table :kategories do |t|
      t.string :name
      t.boolean :aktiv
      t.boolean :brotbestellung

      t.timestamps
    end
  end
end
