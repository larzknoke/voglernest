class AddNachrichtToAnfrage < ActiveRecord::Migration
  def change
    add_column :anfrages, :nachricht, :string
  end
end
