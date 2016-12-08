class HomeController < ApplicationController
before_action :verifyLogin

  def index
    @r_workability = Restaurant.sort_by_workability.first(5)
    @r_parking = Restaurant.sort_by("parking_rating").first(5)
    @r_wifi = Restaurant.sort_by("wifi_rating").first(5)
    @r_seating = Restaurant.sort_by("seating_rating").first(5)
    @r_outlet = Restaurant.sort_by("outlet_rating").first(5)
    @r_atmosphere = Restaurant.sort_by("atmosphere_rating").first(5)
  end

  def search
    search = params[:q]
    @restaurants_by_name = Restaurant.where('lower(name) LIKE ?', "%#{search.downcase}%")
    @restaurants_by_location = Restaurant.where('lower(address) LIKE ?', "%#{search.downcase}%")
    if @restaurants_by_location.empty? && @restaurants_by_name.empty?
     yelp_search(search)
     @restaurants = Restaurant.last(3)
      # @message = "I have nothing, therefore I am nothing."
    elsif params[:q] == ""
      @message = "Try again, dumbass."
    end
  end

private
  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
