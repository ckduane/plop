class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :address, presence: true

  def work_score #calculates workability score
      work_score = 0
    if self.reviews.empty?
      work_score
    else
      reviews.reduce(0){|sum, review| sum + review.work_score} / reviews.length.to_f
    end
  end

  def score(rating) #must pass in rating in quotes
      score = 0
    if reviews.empty?
      return score
    else
      reviews.reduce(0){|sum, review| sum + review.send(rating)} / reviews.length.to_f
    end
  end

  def self.sort_by_workability(postal_code = "")
    if postal_code != ""
      restaurants = Restaurant.where("address LIKE ?", "%#{postal_code}")
      return restaurants.sort {|a, b| b.work_score <=> a.work_score}
    else
      restaurants = Restaurant.all
      return restaurants.sort {|a, b| b.work_score <=> a.work_score}
    end
  end

  def self.sort_by_rating(rating, postal_code) #must pass in rating in quotes
    if postal_code != ""
      restaurants = Restaurant.where("address LIKE ?", "%#{postal_code}")
      return restaurants.sort {|a, b| b.score(rating) <=> a.score(rating)}
    else
      restaurants = Restaurant.all
      return restaurants.sort {|a, b| b.score(rating) <=> a.score(rating)}
    end
  end

end
