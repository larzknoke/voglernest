class Brotbestellposi < ApplicationRecord
  belongs_to :brotsorte
  belongs_to :brotbestellung
end
