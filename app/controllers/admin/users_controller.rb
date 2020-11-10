class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:new, :create]
  before_action :require_owner, only: [:show, :edit, :update, :destroy]

  def index
    if !current_user.is_admin?
      flash[:alert] = "You do not have Admin Rights."
      redirect_to tasks_path
    else
      @user = User.new
      @admins = User.includes(:tasks).where(is_admin: true).order(created_at: :asc).page(params[:page])
      @users = User.includes(:tasks).where(is_admin: false).order(created_at: :asc).page(params[:page])
    end
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:notice] = "New user created"
      redirect_to admin_users_path
    else
      flash[:notice] = "Fill all fields"
      redirect_to admin_users_path
    end
  end

  def show
    @tasks = @user.tasks.page(params[:page])
  end

  def toggle
    @admins = User.where(is_admin: true)
    @user = User.find(params[:id])
    if @admins.count == 1 && @user.is_admin
      flash[:notice] = "There must be at least one admin user"
      redirect_to admin_users_path
    else
      @user.toggle!(:is_admin)
      @user.save
      redirect_to admin_users_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @admins = User.where(is_admin: true)
    if @admins.count == 1 && @user.is_admin
      flash[:notice] = "There must be at least one admin user"
      redirect_to admin_users_path
    else
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "User account deleted successfully"
      redirect_to admin_users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_owner
    if current_user != @user && !current_user.is_admin?
      flash[:alert] = "You can only manage your own account"
      redirect_to tasks_path
    end
  end

end