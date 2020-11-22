class Fewo < ApplicationRecord
  belongs_to :mieter
  acts_as_bookable  time_type: :range,
                    capacity_type: :closed,
                    bookable_across_occurrences: true

end
