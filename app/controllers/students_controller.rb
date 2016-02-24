class StudentsController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_current_trainer
  before_action :set_student, only: [:show, :destroy, :edit, :update]
  before_action :admin_only, only: :index

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    if current_trainer.nil?
      redirect_to root_path, alert: 'You have not permission'
    end
  end

  def create
    @student = Student.new(student_params)
    @student.trainers << current_trainer
    # student = Student.find(params[:student_id])
    # trainer =
    #     current_trainer.students << student unless trainer.students.include?(student)

    if @student.save
      redirect_to root_path, notice: "User was succesfully created!"
    else
      render :new, alert: 'Error!'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
  end

  def edit
    if @student.trainer?
      redirect_to root_path, alert: 'Permission denied'
    end
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to :back, notice: "Sportsman was succesfully updated"
    else
      redirect_to :back, alert: 'Error!'
    end
    @user = User.find(params[:id])
    #   if @user.update_attributes(user_params)
    #     redirect_to user_url, notice: "Updated User."
    #   else
    #     render :edit
    #   end
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :sex, :weight)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
