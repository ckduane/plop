require 'rails_helper'

describe Favorite do
  let(:restaurant) {Restaurant.create(name: "Keith's Restaurant", phone_number: "1234567890", address: "123 Home St", link: "www.plop.com", hours_of_op: "All day")}
  let(:user) {User.create(username: "Ori", email: "Ori", password: "Ori")}
  let(:favorite) {Favorite.create(user_id: user.id, restaurant_id: restaurant.id)}

describe "#favorite.user" do
    context "belongs to a user" do
      it "shows the user object" do
        expect(favorite.user).to eq user
      end
    end
  end

  describe "#favorite.restaurant" do
    context "belongs to a restaurant" do
      it "shows the restaurant object" do
        expect(favorite.restaurant).to eq restaurant
      end
    end
  end
end
