require 'rails_helper'

describe User do
  let(:user) {User.new}

  describe "#add_points" do
    context "when the user writes a review" do
      it "adds 20 points to the user" do
        user.add_points
        expect(user.points).to eq 20
      end
    end
  end

  describe "#username" do
    context "user has a username" do
      it "shows the users username" do
        user.username = "keith"
        expect(user.username).to eq "keith"
      end
    end
  end

  describe "#email" do
    context "user has a email" do
      it "shows the users email" do
        user.email = "keith@keith"
        expect(user.email).to eq "keith@keith"
      end
    end
  end



end

