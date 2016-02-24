class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :require_no_authentication, only: [:create]

  # POST /resource
  def create

    if current_trainer.present?
        if current_trainer.trainer?

          resource_student = User.new(sign_up_params)
          resource_student.student = true

          if resource_student.save

            current_trainer = Trainer.find(current_trainer.id)
            resource_student = Student.find(resource_student.id)
            current_trainer.students << resource_student unless current_trainer.students.include?(resource_student)
            current_trainer.save
            if current_trainer.save
              redirect_to root_path, notice: 'User signed up and added to your sportsmen'
            else
              redirect_to root_path, notice: 'User not signed up. Error!'
            end
          else
            redirect_to :back, alert: 'Error'
          end
        end
    else

    build_resource(sign_up_params)
    #resource.trainer = true
    resource.save

      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          unless current_trainer.present?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            redirect_to :back, notice: 'signed up'
          end
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  private

  def sign_up_params
    params.require(:trainer).permit(:name, :email, :password, :password_confirmation, :birthday, :sex, :weight )
  end

  def account_update_params
    params.require(:trainer).permit(:name, :email, :password, :password_confirmation, :current_password, :birthday, :sex, :weight )
  end

end
