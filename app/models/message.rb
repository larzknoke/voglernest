class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :telefon, :text

  validates :name, :presence => true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+[a-z]{2,})\z/i, message: "ist ungültig!",:allow_nil => true, :allow_blank => true
end
