class AdminController < ApplicationController
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
      redirect_to admin_index_path, notice: 'User was successfully created.' 
    else
      render action: 'new', notice: 'An error occurred, the user was not created.' 
    end
  end

  def update
    if @user.update(params.require(:user).permit(:email))
      redirect_to admin_path, notice: 'User was successfully updated.' 
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_index_path 
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end