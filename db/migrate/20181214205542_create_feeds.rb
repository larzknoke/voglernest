class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :text
      t.integer :priority

      t.timestamps null: false
    end
  end
end
