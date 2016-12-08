class ReviewsController < ApplicationController
  before_action :verifyLogin
  before_action :review_finder


  def show

  end

  def edit

  end

  def create

  end

  def new
    review_finder
    "hello"
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:review).permit(:username, :email, :password)
  end

  def review_finder
    @review = Review.find(params[:id])
  end


  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
