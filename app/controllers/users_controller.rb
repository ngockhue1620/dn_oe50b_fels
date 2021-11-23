class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.present?
      @user
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(sign_in_param)
    if @user.save
      flash[:success] = t "mess.sign_in_success"
      redirect_to root_path
    else
      render :new
    end
  end

  def update; end

  def destroy; end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def sign_in_param
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation, )
  end
  def user_params
    params.require(:user).permit(:name)
  end
end
