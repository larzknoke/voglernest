class CreateBestellungs < ActiveRecord::Migration[6.0]
  def change
    create_table :bestellungs do |t|
      t.string :status
      t.datetime :abholdatum
      t.string :zahlungsmethode
      t.boolean :bezahlt, default: false
      t.boolean :abgeholt, default: false
      t.text :notiz
      t.float :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
