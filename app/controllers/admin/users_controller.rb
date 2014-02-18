class Admin::UsersController < ApplicationController
  before_action :authenticate_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully created.' 
    else
      render action: 'new', notice: 'An error occurred, the user was not created.' 
    end
  end

  def update
    if @user.update(user_params_update)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path 
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def user_params_update
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

    def authenticate_admin
      redirect_to root_path, notice: 'Access not authorized.' unless admin?
    end
end