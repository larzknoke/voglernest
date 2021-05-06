class CreateFewos < ActiveRecord::Migration[6.0]
  def change
    create_table :fewos do |t|
      t.integer :capacity
      t.text :schedule
      t.references :mieter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
