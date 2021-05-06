class Warenkorb < ApplicationRecord
  belongs_to :user
  has_many :warenkorbpositions
end
