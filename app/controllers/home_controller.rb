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


    # render json: Yelp.client.search('San Diego', { term: 'cofee shops' }, limit: 5)
  end

private
  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
