require 'yelp'
# require 'oauth'

puts "consumer_key: #{ENV['YOUR_CONSUMER_KEY']}"
puts "consumer_secret: #{ENV['YOUR_CONSUMER_SECRET']}"
puts "token: #{ENV['YOUR_TOKEN']}"
puts "token_secret: #{ENV['YOUR_TOKEN_SECRET']}"


# client = Yelp::Client.new({ consumer_key: ENV['YOUR_CONSUMER_KEY'],
#                             consumer_secret: ENV['YOUR_CONSUMER_SECRET'],
#                             token: ENV['YOUR_TOKEN'],
#                             token_secret: ENV['YOUR_TOKEN_SECRET']
#                            })


Yelp.client.configure do |config|
  config.consumer_key = ENV['YOUR_CONSUMER_KEY']
  config.consumer_secret = ENV['YOUR_CONSUMER_SECRET']
  config.token = ENV['YOUR_TOKEN']
  config.token_secret = ENV['YOUR_TOKEN_SECRET']
end

# Yelp.client.search('San Diego', {term: 'food'})
