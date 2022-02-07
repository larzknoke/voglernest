class AddNotizToMieter < ActiveRecord::Migration[6.0]
  def change
    add_column :mieters, :notiz, :string, default: ""
  end
end
