module ReviewHelper
  def show_stars(review)
    image_tag "#{review.to_i}star.png"
  end
end
