class Warenkorb < ApplicationRecord
  belongs_to :user, optional: true
  has_many :warenkorbpositions, :dependent => :destroy 
end
