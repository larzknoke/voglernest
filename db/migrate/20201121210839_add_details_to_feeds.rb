class AddDetailsToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :title_details, :string
  end
end
