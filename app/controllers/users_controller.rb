class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User successfully created!"
      sign_in(@user)
      redirect_to @user
    else
      flash[:error] = "User not created.  Try again"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
