class ReviewsController < ApplicationController
  before_action :verifyLogin
  before_action :review_finder, except: [:new, :create]

  def show
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    @review.user_id = session[:user_id]
    if @review.save
      User.find(session[:user_id]).add_points
      redirect_to "/restaurants/#{@review.restaurant_id}"
    else
      @errors = @review.errors.full_messages
      render :new
    end
  end

  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Restaurant.find(params[:restaurant_id]).reviews.new
  end

  def update
    if @review.update(review_params)
      redirect_to "/restaurants/#{@review.restaurant_id}"
    else
      @errors = @review.errors.full_messages
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :user_profile
  end



  private

  def review_params
    params.require(:review).permit(:outlet_rating, :wifi_rating, :seating_rating, :parking_rating, :atmosphere_rating, :comments)
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
