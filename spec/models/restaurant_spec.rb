require 'rails_helper'

describe Restaurant do
  let(:user) {User.create(username: "Ori", email: "Ori", password: "Ori")}
  let(:restaurant) {Restaurant.create(name: "Keith's Restaurant", phone_number: "1234567890", address: "123 Home St", link: "www.plop.com", hours_of_op: "All day")}
  let!(:review) {Review.create(comments: "word", outlet_rating: 1, wifi_rating: 2, seating_rating: 3, parking_rating: 4, atmosphere_rating: 5, restaurant_id: restaurant.id, user_id: user.id)}
  let(:favorite) {Favorite.create(user_id: user.id, restaurant_id: restaurant.id)}

  describe "#name" do
    context "has a name" do
      it "shows the restaurant's name" do
        expect(restaurant.name).to eq "Keith's Restaurant"
      end
    end
  end

  describe "#name" do
    context "has a valid name" do
      it "must have a name" do
        r = Restaurant.new(phone_number: "1234567890", address: "123 Home St", link: "www.plop.com", hours_of_op: "All day")
        expect(r.valid?).to be false
      end
    end
  end

  describe "#address" do
    context "has a valid address" do
      it "must have an address" do
        r = Restaurant.new(name: "Keith's Restaurant", phone_number: "1234567890", link: "www.plop.com", hours_of_op: "All day")
        expect(r.valid?).to be false
      end
    end
  end

  describe "#phone_number" do
    context "has a phone_number" do
      it "shows the restaurant's phone_number" do
        expect(restaurant.phone_number).to eq "1234567890"
      end
    end
  end

  describe "#address" do
    context "has a address" do
      it "shows the restaurant's address" do
        expect(restaurant.address).to eq "123 Home St"
      end
    end
  end

  describe "#link" do
    context "has a link" do
      it "shows the restaurant's link" do
        expect(restaurant.link).to eq "www.plop.com"
      end
    end
  end

  describe "#hours_of_op" do
    context "has a hours_of_op" do
      it "shows the restaurant's hours_of_op" do
        expect(restaurant.hours_of_op).to eq "All day"
      end
    end
  end

  describe "#work_score" do
    context "restaurant has a work_score" do
      it "restaurant has a work_score" do
        expect(restaurant.work_score).to eq 3
      end
    end
  end

  describe "#work_score" do
    context "work_score defaults to 0" do
      r = Restaurant.create(name: "K", phone_number: "1234567890", address: "123 Home St123", link: "www.plop.com", hours_of_op: "All day")
      it "defaults to 0 when there are no reviews" do
        expect(r.work_score).to eq 0
      end
    end
  end

  describe "#score(outlet_rating)" do
    context "restaurant has an outlet rating" do
      it "restaurant has an outlet rating" do
        expect(restaurant.score("outlet_rating")).to eq 1
      end
    end
  end

  describe "#sort_by_workability" do
    context "restaurants can sort by workability" do
      it "restaurant can sort by workability" do
        expect(Restaurant.sort_by_workability.first).to eq restaurant
      end
    end
  end

  describe "#sort_by_workability" do
    context "restaurants can sort by a rating" do
      it "restaurant can sort by a rating" do
        expect(Restaurant.sort_by("outlet_rating").first).to eq restaurant
      end
    end
  end

  describe "has_many reviews" do
    context "restaurants can have many reviews" do
      it "restaurant can have many reviews" do
        expect(restaurant.reviews).to eq [review]
      end
    end
  end

  describe "has_many favorites" do
    context "restaurants can have many favorites" do
      it "restaurant can have many favorites" do
        expect(restaurant.favorites).to eq [favorite]
      end
    end
  end

end
