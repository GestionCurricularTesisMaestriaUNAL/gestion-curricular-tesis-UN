class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]

  # GET /charts
  # GET /charts.json
  def index
    @charts = Chart.all
    @users = User.all
    @roles = Role.all
    @gradeworks = Gradework.all
    @charts= Chart.all.extend(DescriptiveStatistics)
    @totalnuser = User.all.extend(DescriptiveStatistics)
    @estgradework = Gradework.all.extend(DescriptiveStatistics)

    statusgrade
    countUsers
    juriesgrade
    dategrade
  end

  def countUsers
    @countJury = 0
    @countnoRol = 0
    @countStudent = 0
    @countTeacher = 0
    @countAdmin = 0
    @rolesCreados = 0

    @users.each do |user|
      if !user.roles.present?
        @countnoRol += 1
      else
      user.roles.each do |role|
        if role.name == "Jury"
          @countJury += 1
        elsif role.name == "Student"
          @countStudent += 1
        elsif role.name == "Director"
          @countTeacher += 1
        elsif role.name == "Administrator"
          @countAdmin += 1
        end
      end
    end
  end
    @rolesCreados = @countAdmin+@countTeacher+@countStudent+@countJury
  end

def statusgrade
  @totalgradeworks = @estgradework.number
  @countnoStatus = 0
  @statuscalificado = 0
  @statuscalificando = 0
  @statussincalificar = 0

  @gradeworks.each do |gradework|
    if gradework.status == "form-gradework"
      @countnoStatus += 1
    else
      if gradework.status == "calificado"
        @statuscalificado += 1
      end
      if gradework.status == "calificando"
        @statuscalificando += 1
      end
      if gradework.status == "sin calificar"
        @statussincalificar += 1
      end
    end
  end
end

def juriesgrade
  @totalgradeworks = @estgradework.number
  @users = User.all
  @juries = User.users_jury
  @jurados = []
  @juries.each do |jury|
    @jurados.push(jury.firstname+" "+jury.lastname)
  end
  @jurados
end

def dategrade
  @cualquiera = []
    @dategrade1 = 0
    @dategrade2 = 0
    @gradeworks.each do |gradework|
      @cualquiera.push(gradework.created_at)
      if gradework.created_at <= "2017-04-15" && gradework.created_at > "2017-04-01"
        @dategrade1 += 1
      end
      if gradework.created_at <= "2017-04-28" && gradework.created_at > "2017-04-16"
        @dategrade2 += 1
      end
    end
end


# GET /charts/1
# GET /charts/1.json
def show
end

# GET /charts/new
def new
  @chart = Chart.new
  @users = User.all
end

# GET /charts/1/edit
def edit
end

# POST /charts
# POST /charts.json
def create
  @chart = Chart.new(chart_params)

  respond_to do |format|
    if @chart.save
      format.html { redirect_to @chart, notice: 'Chart was successfully created.' }
      format.json { render :show, status: :created, location: @chart }
    else
      format.html { render :new }
      format.json { render json: @chart.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /charts/1
# PATCH/PUT /charts/1.json
def update
  respond_to do |format|
    if @chart.update(chart_params)
      format.html { redirect_to @chart, notice: 'Chart was successfully updated.' }
      format.json { render :show, status: :ok, location: @chart }
    else
      format.html { render :edit }
      format.json { render json: @chart.errors, status: :unprocessable_entity }
    end
  end
end

  # GET /charts/1
  # GET /charts/1.json
  def show
  end

  # GET /charts/new
  def new
    @chart = Chart.new
    @users = User.all
  end

  # GET /charts/1/edit
  def edit
  end

  # POST /charts
  # POST /charts.json
  def create
    @chart = Chart.new(chart_params)

    respond_to do |format|
      if @chart.save
        format.html { redirect_to @chart, notice: 'Chart was successfully created.' }
        format.json { render :show, status: :created, location: @chart }
      else
        format.html { render :new }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charts/1
  # PATCH/PUT /charts/1.json
  def update
    respond_to do |format|
      if @chart.update(chart_params)
        format.html { redirect_to @chart, notice: 'Chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @chart }
      else
        format.html { render :edit }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.json
  def destroy
    @chart.destroy
    respond_to do |format|
      format.html { redirect_to charts_url, notice: 'Chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart
      @chart = Chart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chart_params
      params.fetch(:chart, {})
    end
end
