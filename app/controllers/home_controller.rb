class HomeController < ApplicationController



  def index
  end

  def search


    # render json: Yelp.client.search('San Diego', { term: 'cofee shops' }, limit: 5)
  end
end
