class CreateWarenkorbs < ActiveRecord::Migration[6.0]
  def change
    create_table :warenkorbs do |t|
      t.string :gutschein
      t.datetime :abholdatum
      t.boolean :gast
      t.text :notiz
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
