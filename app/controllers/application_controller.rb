class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    trainers_profile_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def admin_only
    # unless current_user.admin?
    unless current_trainer.admin?
      redirect_to :back, notice: "Access denied"
    end
  end

  def get_collect_sports
    @sports = Sport.all
  end

  def set_current_trainer
    @current_trainer = current_trainer
  end
  # def current_user
  #   @current_user = current_trainer
  # end
end
