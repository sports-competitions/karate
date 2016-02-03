class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :trainer, :student )
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :birthday, :sex, :role, :trainer, :student )
  end

end
