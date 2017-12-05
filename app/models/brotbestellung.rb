class Brotbestellung < ActiveRecord::Base
  has_many :brotbestellposi, dependent: :destroy
  accepts_nested_attributes_for :brotbestellposi, :reject_if => proc { |attributes| attributes['menge'].blank? || (attributes['menge'].to_i < 1)}
  belongs_to :brotbestellschein
end
