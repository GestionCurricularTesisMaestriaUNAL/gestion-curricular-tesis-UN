class GradeworksController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :set_gradework, only: [:show, :edit, :update, :destroy]

  # GET /gradeworks
  # GET /gradeworks.json
  def index
    @gradeworks_id = params[:idGrade] #No Almacena nada....
    p @gradeworks_id
    @gradeworks = Gradework.all
    @juries = User.users_jury
    @directors = User.users_director
    @students = User.users_student
    #@grad_jury = User.role_gradework(1).joins(:roles).where(roles: {name: "Jury"})
    #@grad_director = User.role_gradework(1).joins(:roles).where(roles: {name: "Director"})
    #@grad_student = User.role_gradework(1).joins(:roles).where(roles: {name: "Student"})
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

    if params.has_key?(:directors) and params[:directors] != [""]
    directors = params[:directors]
    @gradework.users << User.find(directors)
    end

    p params.has_key?(:files_list)
    p  params[:files_list]

    respond_to do |format|
      if @gradework.save!

        @gradework.users.each do |us|
          GradeMailer.gradeMail(us ,@gradework).deliver_later!
        end

        # if params.has_key?(:files_list)
        #   files_list = ActiveSupport::JSON.decode(params[:files_list])
        #   # product=Product.create(name: params[:name], description: params[:description])
        #   Dir.mkdir("#{Rails.root}/public/uploads/gradework/file/"+ @gradework.id.to_s)
        #   files_list.each do |pic|
        #     p pic
        #     path = "#{Rails.root}/public/uploads/gradework/file/"+ @gradework.id.to_s+'/'
        #     File.rename( "#{Rails.root}/"+pic, path + File.basename(pic))
        #     FileGradework.create(gradework_id: @gradework.id,name: File.basename(pic), description: MIME::Types.type_for(path), path: path )
        #   end
        # end

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

  def download

    id = params[:id]
    file = FileGradework.find(id)
    #file = @file
    send_file(
        file.path + file.name,
        filename: file.name,
        type: ""
    )
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

  def upload
    uploaded_pics = params[:file]
    time_footprint = Time.now.to_i.to_formatted_s(:number)
	#abort uploaded_pics.inspect
    uploaded_pics.each do |index,pic|
      File.open(Rails.root.join('public', 'uploads', pic.original_filename), 'wb') do |file|
        file.write(pic.read)
        File.rename(file, 'public/uploads/tmp/' + time_footprint + pic.original_filename)
      end
    end
    #files_list = Dir.entries('public/uploads/tmp/').to_json
    files_list = Dir["public/uploads/tmp/*"].to_json
    render json: { message: 'You have successfully uploded your images.', files_list: files_list }
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
