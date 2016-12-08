require 'rails_helper'

describe Review do
  let(:review) {Review.new(outlet_rating: 1, wifi_rating: 2, seating_rating: 3, parking_rating: 4, atmosphere_rating: 5)}

  describe "#outlet_rating" do
    context "has an outlet_rating" do
      it "shows the review's outlet_rating" do
        expect(review.outlet_rating).to eq 1
      end
    end
  end

  describe "#wifi_rating" do
    context "has an wifi_rating" do
      it "shows the review's wifi_rating" do
        expect(review.wifi_rating).to eq 2
      end
    end
  end

  describe "#seating_rating" do
    context "has an seating_rating" do
      it "shows the review's seating_rating" do
        expect(review.seating_rating).to eq 3
      end
    end
  end

  describe "#parking_rating" do
    context "has an parking_rating" do
      it "shows the review's parking_rating" do
        expect(review.parking_rating).to eq 4
      end
    end
  end

  describe "#atmosphere_rating" do
    context "has an atmosphere_rating" do
      it "shows the review's atmosphere_rating" do
        expect(review.atmosphere_rating).to eq 5
      end
    end
  end

  describe "#work_score" do
    context "has an work_score" do
      it "shows the review's work_score" do
        expect(review.work_score).to eq 3
      end
    end
  end
end
