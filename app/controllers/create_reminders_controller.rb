class CreateRemindersController < ApplicationController
  before_action :set_create_reminder, only: [:show, :edit, :update, :destroy]

  # GET /create_reminders
  # GET /create_reminders.json
  def index
    @create_reminders = CreateReminder.all
  end

  # GET /create_reminders/1
  # GET /create_reminders/1.json
  def show
  end

  # GET /create_reminders/new
  def new7
    @create_reminder = CreateReminder.new
  end

  # GET /create_reminders/1/edit
  def edit
  end

  # POST /create_reminders
  # POST /create_reminders.json
  def create
    @create_reminder = CreateReminder.new(create_reminder_params)

    respond_to do |format|
      if @create_reminder.save
        format.html { redirect_to @create_reminder, notice: 'Create reminder was successfully created.' }
        format.json { render :show, status: :created, location: @create_reminder }
      else
        format.html { render :new }
        format.json { render json: @create_reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_reminders/1
  # PATCH/PUT /create_reminders/1.json
  def update
    respond_to do |format|
      if @create_reminder.update(create_reminder_params)
        format.html { redirect_to @create_reminder, notice: 'Create reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_reminder }
      else
        format.html { render :edit }
        format.json { render json: @create_reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_reminders/1
  # DELETE /create_reminders/1.json
  def destroy
    @create_reminder.destroy
    respond_to do |format|
      format.html { redirect_to create_reminders_url, notice: 'Create reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_reminder
      @create_reminder = CreateReminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_reminder_params
      params.require(:create_reminder).permit(:state, :date, :time, :datetime)
    end
end
