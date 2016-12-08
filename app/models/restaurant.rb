class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :address, presence: true

  def work_score #calculates workability score
    if self.reviews.empty?
      work_score = 0
    else
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

  def parking_score
    if self.reviews.empty?
      parking_score = 0
    else
      reviews = self.reviews
      parking_score = 0
      reviews.each{ |review| parking_score += review.parking_rating}
      parking_score = parking_score / reviews.length.to_f
    end
  end

  def outlet_score
    if self.reviews.empty?
      outlet_score = 0
    else
      reviews = self.reviews
      outlet_score = 0
      reviews.each{ |review| outlet_score += review.outlet_rating}
      outlet_score = outlet_score / reviews.length.to_f
    end
  end

  def seating_score
    if self.reviews.empty?
      seating_score = 0
    else
      reviews = self.reviews
      seating_score = 0
      reviews.each{ |review| seating_score += review.seating_rating}
      seating_score = seating_score / reviews.length.to_f
    end
  end

  def atmosphere_score
    if self.reviews.empty?
      atmosphere_score = 0
    else
      reviews = self.reviews
      atmosphere_score = 0
      reviews.each{ |review| atmosphere_score += review.atmosphere_rating}
      atmosphere_score = atmosphere_score / reviews.length.to_f
    end
  end

  def wifi_score
    if self.reviews.empty?
      wifi_score = 0
    else
      reviews = self.reviews
      wifi_score = 0
      reviews.each{ |review| wifi_score += review.wifi_rating}
      wifi_score = wifi_score / reviews.length.to_f
    end
  end

  def self.sort_by_workability
    restaurants = self.all
    restaurants.sort {|a, b| b.work_score <=> a.work_score}
  end

  def self.sort_by_parking
    restaurants = self.all
    restaurants.sort {|a, b| b.parking_score <=> a.parking_score}
  end

  def self.sort_by_outlet
    restaurants = self.all
    restaurants.sort {|a, b| b.outlet_score <=> a.outlet_score}
  end

  def self.sort_by_seating
    restaurants = self.all
    restaurants.sort {|a, b| b.seating_score <=> a.seating_score}
  end

  def self.sort_by_atmosphere
    restaurants = self.all
    restaurants.sort {|a, b| b.atmosphere_score <=> a.atmosphere_score}
  end

  def self.sort_by_wifi
    restaurants = self.all
    restaurants.sort {|a, b| b.wifi_score <=> a.wifi_score}
  end

end
