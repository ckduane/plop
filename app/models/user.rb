class User < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
