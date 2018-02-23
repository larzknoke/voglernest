class Brotbestellung < ActiveRecord::Base
  has_many :brotbestellposi, dependent: :destroy
  accepts_nested_attributes_for :brotbestellposi, :reject_if => proc { |attributes| attributes['menge'].blank? || (attributes['menge'].to_i < 1)}, allow_destroy: true
  belongs_to :brotbestellschein

  validates_length_of :brotbestellposi, :minimum => 1, message: "muss mindestens einmal vorhanden sein!"
  validates :name, presence: true

  amoeba do
    enable
  end
end
