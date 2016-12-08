class ReviewsController < ApplicationController
  before_action :verifyLogin


  def index

  end

  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
