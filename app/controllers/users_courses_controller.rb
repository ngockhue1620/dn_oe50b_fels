class UsersCoursesController < ApplicationController
  before_action :validate_user , only: [:destroy]
  def index
    @courses_of_user = User.find_by(id: session[:user_id])
    if @courses_of_user.present?
      @courses_of_user = @courses_of_user.courses
      if @courses_of_user.size > 0
        @courses_of_user
      else
        flash[:warning] =  t "courses.not_have"
      end
    end
  end

  def create
    if current_user.present?
      @course = Course.find_by(id: params[:users_course][:course_id])
      if @course.present?
        @courses_of_user = UsersCourse.find_by(user_id: session[:user_id], course_id: params[:users_course][:course_id])
        if @courses_of_user.present?
          flash[:warning] = t "courses.is_exists"
          redirect_to @course
        else
          @u_c = UsersCourse.new(user_id: session[:user_id], course_id: params[:users_course][:course_id])
          if @u_c.save
            flash[:success] = t "mess.success"
            redirect_to users_courses_path
          else
            flash[:danger] = t "mess.have_error"
          end

        end
      end
    else
      logout
      redirect_to root_url
    end
  end

  def destroy
    @user_course = UsersCourse.find_by(id: params[:id])
    if @user_course.user_id != session[:user_id] && !is_admin?
      validate_user
    else
      if @user_course.present?
        if @course.destroy
          flash[:success] = t "mess.success"
        else
          flash[:danger] = t "mess.have_error"
        end
      else
        flash[:warning] = t "courses.not_found"
      end
    end
  end

  private

  def validate_user
    unless is_admin?
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end
end
