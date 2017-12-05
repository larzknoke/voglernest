class CreateBrotbestellposis < ActiveRecord::Migration
  def change
    create_table :brotbestellposis do |t|
      t.integer :menge
      t.references :brotsorte, index: true, foreign_key: true
      t.references :brotbestellung, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
