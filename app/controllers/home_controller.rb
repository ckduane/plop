class HomeController < ApplicationController
before_action :verifyLogin

  def index
    long = params["long"]
    lat = params["lat"]
    geo_localization = "#{lat},#{long}"
    query = Geocoder.search(geo_localization).first
    if query.present? && request.xhr?
      puts "QUERY PRESENT!!!"
      @postal_code = query.postal_code
      @r_workability = Restaurant.sort_by_workability(@postal_code).first(6)
      @r_parking = Restaurant.sort_by_rating("parking_rating", @postal_code).first(6)
      @r_wifi = Restaurant.sort_by_rating("wifi_rating", @postal_code).first(6)
      @r_seating = Restaurant.sort_by_rating("seating_rating", @postal_code).first(6)
      @r_outlet = Restaurant.sort_by_rating("outlet_rating", @postal_code).first(6)
      @r_atmosphere = Restaurant.sort_by_rating("atmosphere_rating", @postal_code).first(6)
      puts "@postal_code: #{@postal_code}"
      puts "@r_parking: #{@r_parking}"
      render :index, :layout => false
    else
      puts "QUERY ABSENT!!!"
      @r_workability = Restaurant.sort_by_workability.first(6)
      @r_parking = Restaurant.sort_by_rating("parking_rating", "").first(6)
      @r_wifi = Restaurant.sort_by_rating("wifi_rating", "").first(6)
      @r_seating = Restaurant.sort_by_rating("seating_rating", "").first(6)
      @r_outlet = Restaurant.sort_by_rating("outlet_rating", "").first(6)
      @r_atmosphere = Restaurant.sort_by_rating("atmosphere_rating", "").first(6)
    end
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
