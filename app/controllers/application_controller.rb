class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :require_user

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] ="You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
