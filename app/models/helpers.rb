class Helpers
  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect "/login"
    end
  end

  def current_user
    User.find(session[:user_id])
  end
end
