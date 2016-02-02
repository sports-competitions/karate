class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
  end

  def index
    @users = User.all
    if current_user.trainer?
      @current_trainer = Trainer.find(current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.trainer?
      @trainer = Trainer.find(@user.id)
      @students = @trainer.students
      @current_trainer = Trainer.find(current_user.id)
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
end
