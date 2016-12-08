class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :address, presence: true

  def work_score #calculates workability score
    reviews = self.reviews
    work_score = 0
    reviews.each do |review|
      work_score += review.outlet_rating
      work_score += review.wifi_rating
      work_score += review.seating_rating
      work_score += review.parking_rating
      work_score += review.atmosphere_rating
      work_score = work_score / 5.0
    end
    work_score = work_score / reviews.length
    return work_score
  end
end
