class Brotsorte < ApplicationRecord
  has_many :brotbestellposi
  belongs_to :brottyp
  has_one_attached :brotbild
  # validates_attachment_content_type :brotbild, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #validates_attachment_presence :brotbild
end
