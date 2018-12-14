json.extract! feed, :id, :title, :text, :created_at, :updated_at
json.url feed_url(feed, format: :json)
