# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!([
{username: "Ori", email: "ori@gmail.com", password: "123"},
{username: "Matt", email: "matt@gmail.com", password: "123"},
{username: "Christine", email: "christine@gmail.com", password: "123"},
{username: "Keith", email: "keith@gmail.com", password: "123"}
  ])

restaurants = Restaurant.create!([
{name: "Young Hickory", phone_number: "(619) 795-6574", address: "4096 30th St., San Diego, CA 92104", link: "www.younghickory.com", hours_of_op: "7AM - 12AM"},
{name: "Tea & Coffee Collective", phone_number: "(619) 564-8086", address: "631 Ninth Ave, San Diego, CA 92101", link: "www.coffeeandteacollective.com", hours_of_op: "7AM - 4PM"},
{name: "Starbucks", phone_number: "(619) 693-3750", address: "1011 Market St., San Diego, CA 92101", link: "www.starbucks.com", hours_of_op: "5AM - 9PM"},
{name: "Lofty", phone_number: "(760) 230-6747", address: "132 S Cedros Ave., Solana Beach, CA 92075", link: "www.loftycoffee.com", hours_of_op: "6AM - 6PM"},
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
