class CreateBrotbestellscheins < ActiveRecord::Migration
  def change
    create_table :brotbestellscheins do |t|
      t.datetime :datum
      t.datetime :versendet

      t.timestamps null: false
    end
  end
end
