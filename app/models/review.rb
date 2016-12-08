class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :outlet_rating, presence: true, :inclusion => {:in => 1..5}
  validates :wifi_rating, presence: true, :inclusion => {:in => 1..5}
  validates :seating_rating, presence: true, :inclusion => {:in => 1..5}
  validates :parking_rating, presence: true, :inclusion => {:in => 1..5}
  validates :atmosphere_rating, presence: true, :inclusion => {:in => 1..5}
  validates :user_id, presence: true, uniqueness: { scope: :restaurant_id }
  validates :restaurant_id, presence: true
  validates :comments, presence: true

  def work_score
    (self.outlet_rating + self.wifi_rating + self.seating_rating + self.parking_rating + self.atmosphere_rating) / 5.0
  end

end
