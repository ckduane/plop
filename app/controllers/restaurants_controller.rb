class RestaurantsController < ApplicationController
before_action :verifyLogin

  def show
    @restaurant = Restaurant.find(params[:id])
  end

private
  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
