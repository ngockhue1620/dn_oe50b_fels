class HomeController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: login_params[:user_name])
    if @user&.authenticate(login_params[:password])
      login_in @user
      redirect_to courses_path
    else
      render root_url
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def login_params
    params.require(:session).permit(:user_name, :password)
  end
end
