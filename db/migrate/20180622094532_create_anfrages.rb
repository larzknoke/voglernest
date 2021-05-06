class CreateAnfrages < ActiveRecord::Migration[6.0]
  def change
    create_table :anfrages do |t|
      t.string :name
      t.string :email
      t.string :telefon
      t.integer :anzahl
      t.text :antwort
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
