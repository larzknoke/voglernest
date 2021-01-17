class Brotbestellung < ApplicationRecord
  has_many :brotbestellposi, dependent: :destroy
  accepts_nested_attributes_for :brotbestellposi, :reject_if => proc { |attributes| attributes['menge'].blank? || (attributes['menge'].to_i < 1)}, allow_destroy: true
  belongs_to :brotbestellschein, optional: true

  validates_length_of :brotbestellposi, :minimum => 1, message: "muss mindestens einmal vorhanden sein!"
  validates :name, presence: true

  amoeba do
    enable
  end

  def versendet
   self.brotbestellschein.present? && self.brotbestellschein.versendet.present?
  end

  def vollname
    (self.vorname.present? ? "#{self.vorname} " : "") + (self.name.present? ? self.name : "") 
  end

end
