class CreateOpenhours < ActiveRecord::Migration
  def change
    create_table :openhours do |t|
      t.string :tag
      t.time :start
      t.time :ende
      t.boolean :spezial
      t.boolean :geschlossen

      t.timestamps null: false
    end
  end
end
