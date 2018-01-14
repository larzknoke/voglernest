class CreateBrotbestellungs < ActiveRecord::Migration
  def change
    create_table :brotbestellungs do |t|
      t.string :vorname
      t.string :name
      t.string :telefon
      t.string :email
      t.datetime :datum
      t.string :typ, :default => 'bestellung'
      t.references :brotbestellschein, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
