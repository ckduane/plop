module ReviewHelper
  def show_stars(review)
    image_tag "#{review.to_i}star.png"
  end

  def review_zero?(score)
    if score == 0.0
      return " ..not rated yet!"
    else
      return score
    end
  end
end
