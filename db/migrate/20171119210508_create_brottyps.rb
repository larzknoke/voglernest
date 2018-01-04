class CreateBrottyps < ActiveRecord::Migration
  def change
    create_table :brottyps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
