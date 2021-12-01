class UsersController < ApplicationController
  before_action :validate_user, only: [:edit, :update, :destroy, :index]
  def index
    @users = User.all
  end

  def show
    if params[:id] != session[:user_id] && !is_admin?
      validate_user
    else
      @user = User.find_by(id: params[:id])
      if @user.present?
        @user
      else
        validate_user
      end
    end
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(sign_in_param)
    @user.is_admin = false
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

  def sign_in_param
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def validate_user
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
  end
end
