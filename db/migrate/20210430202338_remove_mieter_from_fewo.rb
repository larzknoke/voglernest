class RemoveMieterFromFewo < ActiveRecord::Migration[6.0]
  def change
    remove_reference :fewos, :mieter, null: false, foreign_key: true
  end
end
