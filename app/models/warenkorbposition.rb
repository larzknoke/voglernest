class Warenkorbposition < ApplicationRecord
  belongs_to :warenkorb
  belongs_to :produkt
end
