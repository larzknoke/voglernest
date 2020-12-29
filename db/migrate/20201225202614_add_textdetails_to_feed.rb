class AddTextdetailsToFeed < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :text_details, :text
    add_column :feeds, :deaktiviert, :boolean, :default => false
    add_column :feeds, :vorschaubild, :boolean, :default => false
  end
end
