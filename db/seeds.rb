users = User.create!([
{username: "Ori", email: "ori@gmail.com", password: "123"},
{username: "Matt", email: "matt@gmail.com", password: "123"},
{username: "Christine", email: "christine@gmail.com", password: "123"},
{username: "Keith", email: "keith@gmail.com", password: "123"}
  ])

reviews = Review.create!([
  {outlet_rating: 4, wifi_rating: 4, seating_rating: 5, parking_rating: 4, atmosphere_rating: 5, user_id: 1, restaurant_id: 1, comments: "Cool place, great vibe!"}, #4.4
  {outlet_rating: 5, wifi_rating: 5, seating_rating: 4, parking_rating: 3, atmosphere_rating: 4, user_id: 2, restaurant_id: 2, comments: "They have outlets on the tables!! Good coffee too."},
  {outlet_rating: 3, wifi_rating: 3, seating_rating: 3, parking_rating: 4, atmosphere_rating: 3, user_id: 3, restaurant_id: 3, comments: "Best thing is, you know exactly what you're getting."},
  {outlet_rating: 3, wifi_rating: 2, seating_rating: 3, parking_rating: 5, atmosphere_rating: 2, user_id: 4, restaurant_id: 4, comments: "Great place to get some work done."}
  ])


favorites = Favorite.create!([
  {user_id: 4, restaurant_id: 1},
  {user_id: 3, restaurant_id: 2},
  {user_id: 2, restaurant_id: 3},
  {user_id: 1, restaurant_id: 4}
  ])

client = Yelp.client.search('San Diego', { term: 'coffee shops' }, limit: 40)
client.businesses.each do |business|
  Restaurant.create!(name: business.name,
                      phone_number: business.phone,
                      address: business.location.display_address.join(" "),
                      link: business.url
                      )
  end

client = Yelp.client.search('San Diego', { term: 'beer' }, limit: 40)
client.businesses.each do |business|
  Restaurant.create!(name: business.name,
                      phone_number: business.phone,
                      address: business.location.display_address.join(" "),
                      link: business.url
                      )
end
