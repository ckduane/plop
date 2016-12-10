module UserHelper
  def find_current_user
    User.find(session[:user_id])
  end

  def find_review
    @restaurant.reviews.find{ |review| review.user_id == session[:user_id] }
  end

  def find_favorite
    @restaurant.favorites.find{ |favorite| favorite.user_id == session[:user_id] }
  end
end
