module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def authorize_owner
    redirect_to root_path unless current_user == @owner
  end

  def is_admin?
    if logged_in?
      current_user[:admin]
    end
  end

end
