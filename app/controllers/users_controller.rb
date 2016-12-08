class UsersController < ApplicationController
before_action :verifyLogin, only: [:profile]
  def register
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to action: :login
    else
      @errors = @user.errors.full_messages
      render :register
    end
  end

  def login

  end

  def validate
    @user = User.find_by(email: params["user"]["email"])
    if @user && @user.authenticate(params["user"]["password"])
      session[:user_id] = @user.id
      redirect_to :root
    else
      @error = "Incorrect Username/Password"
      render :login
    end
  end

  def logout
    reset_session
    redirect_to :root
  end

  def profile
    if User.find(session[:user_id]).id == params[:id].to_i
      @reviews = @user.reviews
      @favorites = @user.favorites
    else
      redirect_to :root
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def verifyLogin
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
