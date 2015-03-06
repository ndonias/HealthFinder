class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    articles_path
  end

  protected

  def authenticate_admin!
  	unless current_user.admin?
  		flash[:notice] = "You do not have permission to do that."
  		redirect_to root_path
  	end
  end
end
