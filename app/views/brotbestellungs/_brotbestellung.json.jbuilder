json.extract! brotbestellung, :id, :vorname, :name, :telefon, :email, :created_at, :updated_at
json.url brotbestellung_url(brotbestellung, format: :json)
