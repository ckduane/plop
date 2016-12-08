class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :favorites

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def add_points
    self.points += 20
  end

end
