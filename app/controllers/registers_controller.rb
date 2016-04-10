class RegistersController < ApplicationController
  before_action :authenticate_registrator!
  before_action :set_event
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  before_action :set_sportsmans, only: [:edit, :update]

  # GET /registers
  # GET /registers.json
  def index
    @registers = @event.registers
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @sportsmans = @register.people
  end

  # GET /registers/new
  def new
    @register = @event.registers.build
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = @event.registers.build(register_params)
    @register.registrator = current_registrator
    # @people = Person.where(kind: "sportsman").where(registrator: current_registrator)
    # @people << Person.find(params[:person_id])

    respond_to do |format|
      if @register.save
        # @register.people << @people
        format.html { redirect_to event_register_url(@event, @register), notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: event_register_url(@event, @register) }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to event_register_url(@event, @register), notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: event_register_url(@event, @register) }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to event_registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_sportsmans
      @sportsmans = Person.where(kind: "sportsman").where(registrator: current_registrator)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = @event.registers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:event_id, :name, person_ids: [])
    end
end
