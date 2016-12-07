class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :address, presence: true
end
