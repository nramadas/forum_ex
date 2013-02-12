class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user
      flash[:success] = "Welcome back" # Remember to user flash.now, otherwise the notice
      # will persist over a request.
      sign_in(user)
      redirect_to user
    else
      flash[:error] = "Try again"
      render :new
    end
  end

  def destroy
    current_user.remember_token = nil
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to root_path
  end

end
