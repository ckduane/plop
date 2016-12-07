class UsersController < ApplicationController

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

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
