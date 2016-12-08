module UserHelper
  def find_current_user
    User.find(session[:user_id])
  end
end
