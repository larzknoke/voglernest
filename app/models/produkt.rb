class Produkt < ApplicationRecord
  has_many :warenkorbpositions
  has_many :bestellpositions
  belongs_to :kategorie
  has_one_attached :produktbild
end
