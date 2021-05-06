class Bestellposition < ApplicationRecord
  belongs_to :bestellung
  belongs_to :produkt
end
