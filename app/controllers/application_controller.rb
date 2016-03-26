class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from AccessGranted::AccessDenied do |exception|
    flash[:error] = "You don't have permissions to access this page."
    redirect_to root_path
  end

  def current_user
    current_registrator
  end

end
