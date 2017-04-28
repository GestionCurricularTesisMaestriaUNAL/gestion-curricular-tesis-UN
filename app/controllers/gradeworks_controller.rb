class GradeworksController < ApplicationController
  before_action :set_gradework, only: [:show, :edit, :update, :destroy]

  # GET /gradeworks
  # GET /gradeworks.json
  def index
    @gradeworks = Gradework.all
    @juries = User.users_jury
    @directors = User.users_director
    @students = User.users_student
  end

  # GET /gradeworks/1
  # GET /gradeworks/1.json
  def show
  end

  # GET /gradeworks/new
  def new
    @gradework = Gradework.new
    @juries = User.users_jury
    @directors = User.users_director
    @students = User.users_student
  end

  # GET /gradeworks/1/edit
  def edit

    @juries = User.users_jury
    @directors = User.users_director
    @students = User.users_student
    
    @grad_directors = @gradework.users.joins(:roles).where(roles: {name: "Director"}).ids
    @grad_juries = @gradework.users.joins(:roles).where(roles: {name: "Jury"}).ids
    @grad_students = @gradework.users.joins(:roles).where(roles: {name: "Student"}).ids
  end

  # POST /gradeworks
  # POST /gradeworks.json
  def create
    @gradework = Gradework.new(gradework_params)

    if params.has_key?(:students) and params[:students] != [""]
    students = params[:students]
    @gradework.users << User.find(students)
    end

    if params.has_key?(:juries) and params[:juries] != [""]
    juries = params[:juries]
    @gradework.users << User.find(juries)
    end

    if params.has_key?(:directors) and params[:directors] =! ""
    directors = params[:directors]
    @gradework.users << User.find(directors)
    end

    respond_to do |format|
      if @gradework.save!
        format.html { redirect_to @gradework, notice: 'La tesis se creó correctamente' }
        format.json { render :show, status: :created, location: @gradework }
      else
        format.html { redirect_to @gradework, notice: 'La tesis no se pudo crear correctamente' }
        format.json { render json: @gradework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gradeworks/1
  # PATCH/PUT /gradeworks/1.json
  def update

    @gradework.users = []

    if params.has_key?(:students) and params[:students] != [""]
      students = params[:students]
      @gradework.users << User.find(students)
    end

    if params.has_key?(:juries) and params[:juries] != [""]
      juries = params[:juries]
      @gradework.users << User.find(juries)
    end

    if params.has_key?(:directors) and params[:directors] =! ""
      directors = params[:directors]
      @gradework.users << User.find(directors)
    end

    respond_to do |format|
      if @gradework.update(gradework_params)
        format.html { redirect_to @gradework, notice: 'La tesis se modificó correctamente' }
        format.json { render :show, status: :ok, location: @gradework }
      else
        format.html { redirect_to @gradework, notice: 'La tesis no se modificó correctamente' }
        #format.html { render :edit }
        format.json { render json: @gradework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gradeworks/1
  # DELETE /gradeworks/1.json
  def destroy
    @gradework.destroy
    respond_to do |format|
      format.html { redirect_to gradeworks_url, notice: 'La tesis se eliminó correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gradework
      @gradework = Gradework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gradework_params
      params.require(:gradework).permit(:name, :description, :status, :delivery_date, :begin_date, :hour, :locale, :semester, :file)
    end
end
