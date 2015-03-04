class UsersController < ApplicationController
  #before_action :set_user, only: [:edit, :update, :show, :destroy]


  def index
      @users = User.all
    end

  def new
    @user = User.new
  end

  def show
  end

  def update
    @user.update(params[:user])
    redirect_to users_path, notice: "User succesfully updated."
  end

  def create
    @user = User.create(params[:user])
    if @user.save
    redirect_to @user, notice: "New user created." 
  else
    render :new
    end

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted successfully."
    else
      flash[:alert] = "There was a problem deleting the user."
    end
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :newsletter)
  end
end





