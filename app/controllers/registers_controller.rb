class RegistersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_register, only: [:show, :edit, :update, :destroy, :select_combats]
  before_action :set_people, only: [:new, :edit, :update, :select_combats]

  def index
    @registers = @event.registers
  end

  def show
    @people = @register.people
    @combats = @event.combats
  end

  def select_combats
    @person = Person.find(params[:person][:person_id])
    if @person.update(select_combats_params)
      redirect_to event_register_url(@event, @register)
    end
  end

  def new
    @register = @event.registers.build
  end

  def edit
  end

  def create
    @register = @event.registers.build(register_params)
    @register.user = current_user

    respond_to do |format|
      if @register.save
        format.html { redirect_to event_register_url(@event, @register), notice: 'Заявка успішно подана' }
        format.json { render :show, status: :created, location: event_register_url(@event, @register) }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to event_register_url(@event, @register), notice: 'Заявка оновлена' }
        format.json { render :show, status: :ok, location: event_register_url(@event, @register) }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to event_registers_url, notice: 'Заявка видалена' }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_people
      @people = Person.where(kind: "sportsman").where(user: current_user)
    end

    def set_register
      @register = @event.registers.find(params[:id])
    end

    def register_params
      params.require(:register).permit(:event_id, :name, person_ids: [])
    end

    def select_combats_params
      params.require(:person).permit(combat_ids: [])
    end
end
