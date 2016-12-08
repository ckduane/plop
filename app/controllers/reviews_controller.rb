class ReviewsController < ApplicationController
  before_action :review_finder

  def show

  end

  def edit

  end

  def create

  end

  def new
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:restaurant).permit(:username, :email, :password)
  end

  def review_finder
    @review = Review.find(params[:id])
  end


end
