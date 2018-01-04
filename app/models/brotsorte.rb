class Brotsorte < ActiveRecord::Base
  has_many :brotbestellposi
  belongs_to :brottyp
end
