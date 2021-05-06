json.extract! warenkorb, :id, :gutschein, :abholdatum, :gast, :notiz, :user_id, :created_at, :updated_at
json.url warenkorb_url(warenkorb, format: :json)
