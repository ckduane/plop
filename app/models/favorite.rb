class Favorite < ActiveRecord::Base
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
end
