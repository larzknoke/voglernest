class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false},
          length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true,  uniqueness: true
  validates :password, length: {minimum: 5}

end
