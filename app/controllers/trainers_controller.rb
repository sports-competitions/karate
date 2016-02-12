class TrainersController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_current_trainer
  before_action :admin_only, only: :index

  def profile
    if current_trainer.present?
      @current_trainer = current_trainer
      @students = @current_trainer.students
    end
    #if current_user.student?
      #@current_student = Student.find(current_user.id)
    #end
  end

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end
  #
  # def new
  #   @user = User.new
  #   unless current_user.trainer?
  #     redirect_to root_path, alert: 'You have not permission'
  #   end
  # end
  #
  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     redirect_to user_url, notice: "Updated User."
  #   else
  #     render :edit
  #   end
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path, notice: "User succesfully created!"
  #   else
  #     render :new
  #   end
  # end


  def add_student_to_trainer
    student = Student.find(params[:student_id])
    trainer = Trainer.find(params[:trainer_id])
    trainer.students << student unless trainer.students.include?(student)
    if(trainer.save)
      redirect_to :back, notice: "Студент добавлен"
    else
      redirect_to :back, alert: "Ошибка"
    end
  end

  def delete_student_from_trainer
    student = Student.find(params[:student_id])
    trainer = Trainer.find(params[:trainer_id])
    trainer.students.destroy(student)
    if(trainer.save)
      redirect_to :back, notice: "Студент удален"
    else
      redirect_to :back, alert: "Ошибка"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
