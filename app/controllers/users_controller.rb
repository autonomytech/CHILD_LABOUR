class UsersController < ApplicationController
  add_breadcrumb 'Dashboard', :root_path
  add_breadcrumb 'Users', :users_path
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_role_and_department, only: [:new, :create, :edit, :update, :show]
  # GET /users
  # GET /users.json
  def index
    @users = User.japu_users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.community_id = current_user.community_id
    respond_to do |format|
      if @user.save
        # UserMailer.welcome_email(@user.id, params[:user][:password]).deliver_later
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
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
    @user.update(email: "_deleted_#{@user.email}", is_deleted: true)
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_role_and_department
    @roles = Role.all.collect { |e| [e.role, e.id] }
    @departments = Department.all.collect { |d| [d.name, d.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:title, :first_name, :middle_name\
    , :last_name, :designation, :department_id, :role_id\
    , :contact_no, :email, :password, :community_id)
  end
end
