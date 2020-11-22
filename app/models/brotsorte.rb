class Brotsorte < ApplicationRecord
  has_many :brotbestellposi
  belongs_to :brottyp
  has_attached_file :brotbild, attachment_presence: false, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :brotbild, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #validates_attachment_presence :brotbild
end
