class AddNachrichtToAnfrage < ActiveRecord::Migration[6.0]
  def change
    add_column :anfrages, :nachricht, :string
  end
end
