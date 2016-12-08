class HomeController < ApplicationController



  def index
  end

  def search
client = Yelp.client.search('San Diego', { term: 'cofee shops' }, limit: 40)
    client.businesses.each do |business|
      Restaurant.new(name: business.name,
                      phone_number: business.phone,
                      address: business.location.display_address.join(" "),
                      link: business.url
                         )
    end

    # render json: Yelp.client.search('San Diego', { term: 'cofee shops' }, limit: 5)
  end
end
