class MailsShowersController < ApplicationController
  before_action :set_mails_shower, only: [:show, :edit, :update, :destroy]

  # GET /mails_showers
  # GET /mails_showers.json
  def index
    @mails_showers = MailsShower.all
    @reminders = CreateReminder.all
    @gradeworks = Gradework.all
    @mailtemp = MailTemplate.all

    @remindersdate = CreateReminder.reminder_date
    @reminderstime = CreateReminder.reminder_time
    @mailtempname= MailTemplate.name
    @remindersname = Gradework.name

  end

  # GET /mails_showers/1
  # GET /mails_showers/1.json
  def show
  end

  # GET /mails_showers/new
  def new
    @mails_shower = MailsShower.new
  end

  # GET /mails_showers/1/edit
  def edit
  end

  # POST /mails_showers
  # POST /mails_showers.json
  def create
    @mails_shower = MailsShower.new(mails_shower_params)

    respond_to do |format|
      if @mails_shower.save
        format.html { redirect_to @mails_shower, notice: 'Mails shower was successfully created.' }
        format.json { render :show, status: :created, location: @mails_shower }
      else
        format.html { render :new }
        format.json { render json: @mails_shower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mails_showers/1
  # PATCH/PUT /mails_showers/1.json
  def update
    respond_to do |format|
      if @mails_shower.update(mails_shower_params)
        format.html { redirect_to @mails_shower, notice: 'Mails shower was successfully updated.' }
        format.json { render :show, status: :ok, location: @mails_shower }
      else
        format.html { render :edit }
        format.json { render json: @mails_shower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mails_showers/1
  # DELETE /mails_showers/1.json
  def destroy
    @mails_shower.destroy
    respond_to do |format|
      format.html { redirect_to mails_showers_url, notice: 'Mails shower was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mails_shower
      @mails_shower = MailsShower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mails_shower_params
      params.fetch(:mails_shower, {})
    end
end
