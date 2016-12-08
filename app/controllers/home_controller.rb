class HomeController < ApplicationController
before_action :verifyLogin

  def index
    @r_workability = Restaurant.sort_by_workability.first(5)
    @r_parking = Restaurant.sort_by_parking.first(5)
    @r_wifi = Restaurant.sort_by_wifi.first(5)
    @r_seating = Restaurant.sort_by_seating.first(5)
    @r_outlet = Restaurant.sort_by_outlet.first(5)
    @r_atmosphere = Restaurant.sort_by_atmosphere.first(5)
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
