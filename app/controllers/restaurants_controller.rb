class RestaurantsController < ApplicationController
before_action :verifyLogin

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def favorite
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @user.favorites.include?(@restaurant)
      redirect_to restaurant_path(@restaurant.id), :notice => "You've already done this."
    else
      Favorite.create(user_id: @user.id, restaurant_id: @restaurant.id)
      redirect_to restaurant_path(@restaurant.id)
    end
  end

private
  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
