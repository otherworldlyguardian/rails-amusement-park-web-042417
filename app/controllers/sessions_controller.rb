class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by_name(login_params[:name])
    if user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    redirect_to root_path
  end

  private

  def login_params
    params.require(:user)
  end
end
