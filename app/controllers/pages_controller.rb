class PagesController < ApplicationController
  def index
    if trainer_signed_in?
      redirect_to trainers_profile_path
    else
      redirect_to new_trainer_session_path
    end
  end
end
