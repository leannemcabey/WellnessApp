class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]
    before_action :require_login, only: [:show, :edit, :update, :destroy]
  def show
    @user=current_user
  if session[:user_id]!=params[:id]
    redirect_to user_path(session[:user_id])
    return
  end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
    # THIS PATH SHOULD BE UPDATED ONCE WE HAVE A LOGIN PAGE OR SOMETHING
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
