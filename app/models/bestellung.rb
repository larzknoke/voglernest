class Bestellung < ApplicationRecord
  belongs_to :user
  has_many :bestellpositions
end
