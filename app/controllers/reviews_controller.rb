class ReviewsController < ApplicationController
  before_action :verifyLogin


  def index
    @r_workability = Restaurant.sort_by_workability
    @r_workability = Restaurant.sort_by_parking
    @r_workability = Restaurant.sort_by_workability
    @r_workability = Restaurant.sort_by_workability
    @r_workability = Restaurant.sort_by_workability
    @r_workability = Restaurant.sort_by_workability
  end

  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
