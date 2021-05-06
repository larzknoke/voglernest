class AddDetailsToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :title_details, :string
  end
end
