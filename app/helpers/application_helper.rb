module ApplicationHelper

  def yelp_search(term)
  client = Yelp.client.search('San Diego', { term: "#{term}" }, limit: 3)
  client.businesses.each do |business|
    Restaurant.create!(name: business.name,
                        phone_number: business.phone,
                        address: business.location.display_address.join(" "),
                        link: business.url
                        )
    end
  end

end
