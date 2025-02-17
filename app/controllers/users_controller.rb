class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
