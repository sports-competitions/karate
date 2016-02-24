class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]
  before_action :admin_only
  before_action :get_collect_sports, except: [:index, :show, :destroy]

  def index
    @qualifications = Qualification.all
  end

  def show
  end

  def new
    @qualification = Qualification.new
  end

  def edit
  end

  def create
    @qualification = Qualification.new(qualification_params)
    @qualification.user = current_user
    if @qualification.save
      redirect_to @qualification, notice: 'Qualification was successfully created.'
    else
      render :new
    end
  end

  def update
    if @qualification.update(qualification_params)
      redirect_to @qualification, notice: 'Qualification was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @qualification.destroy
    redirect_to qualifications_url, notice: 'Qualification was successfully destroyed.'
  end

  private
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    def qualification_params
      params.require(:qualification).permit(:title, :view, :sport_id, :user_id)
    end
end
