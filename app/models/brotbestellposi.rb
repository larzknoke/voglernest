class Brotbestellposi < ActiveRecord::Base
  belongs_to :brotsorte
  belongs_to :brotbestellung
end
