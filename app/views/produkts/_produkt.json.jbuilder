json.extract! produkt, :id, :name, :aktiv, :ausverkauft, :preis, :warenkorbposition_id, :bestellposition_id, :created_at, :updated_at
json.url produkt_url(produkt, format: :json)
