json.extract! bestellung, :id, :status, :abholdatum, :zahlungsmethode, :bezahlt, :abgeholt, :noitz, :total, :user_id, :created_at, :updated_at
json.url bestellung_url(bestellung, format: :json)
