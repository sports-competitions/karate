class UsersController < ApplicationController
  before_action :authenticate_trainer!
  before_action :admin_only, only: :index
  before_action :set_current_trainer

  def index
      @current_trainer = current_trainer
      @students = @current_trainer.students
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_trainer = current_trainer

    if @user.trainer?
      @trainer = Trainer.find(@user.id)
      @students = @trainer.students
    end

    if @user.student?
      @student = Student.find(@user.id)
      @trainers = @student.trainers
    end
  end

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
