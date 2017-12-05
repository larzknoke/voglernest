class Mieter < ActiveRecord::Base
  has_many :fewos
  acts_as_booker time_type: :range, bookable_across_occurrences: true
  def name_with_initial
    "ID: #{id} / #{vorname} #{name}"
  end
end
