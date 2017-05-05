class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @totaluser = User.all.extend(DescriptiveStatistics)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @roles = Role.all
  end

  # GET /users/1/edit
  def edit
      @rol_users = @user.roles.ids
      @roles = Role.all
  end

  # POST /users
  # POST /users.json
  def create

    #byebug
    #user_params
    @user = User.new(user_params)

    if params.has_key?(:rol) and params[:rol] != [""]
    role_id = params[:rol]
    @user.roles << Role.find(role_id)
    end

    respond_to do |format|
      if @user.save

        WelcomeMailer.notify(@user).deliver_now
     #   user_id = @user.id
     #   RoleUser.create(role_id: user_id, user_id: user_id)

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.jso
  def update

    @user.roles = []

    if params.has_key?(:rol) and params[:rol] != [""]
      role_id = params[:rol]
      @user.roles << Role.find(role_id)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :identification, :phone )
    end
end
