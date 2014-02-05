class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :admin?

  protected

  def admin?
  	role ||= User.find(session[:user_id]).role if session[:user_id]
  	if role != nil && role == "admin"
  		true
  	else
  		false
  	end
  end

  def authorize
  	unless admin?
  		flash[:error] = "Unauthorized access"
  		redirect_to sign_up_path
  		false
  	end
  end

  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end