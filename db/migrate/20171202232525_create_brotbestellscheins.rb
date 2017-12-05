class CreateBrotbestellscheins < ActiveRecord::Migration
  def change
    create_table :brotbestellscheins do |t|
      t.datetime :datum

      t.timestamps null: false
    end
  end
end
