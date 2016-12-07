class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :outlet_rating, presence: true, :inclusion => {:in => 1..5}
  validates :wifi_rating, presence: true, :inclusion => {:in => 1..5}
  validates :seating_rating, presence: true, :inclusion => {:in => 1..5}
  validates :parking_rating, presence: true, :inclusion => {:in => 1..5}
  validates :atmosphere, presence: true, :inclusion => {:in => 1..5}
  validates :user_id, presence: true, uniqueness: { scope: :restaurant_id }
  validates :restaurant_id, presence: true
  validates :comments, presence: true

end
