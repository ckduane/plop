class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :restaurant_id }
end
