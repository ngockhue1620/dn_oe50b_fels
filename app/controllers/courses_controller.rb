class CoursesController < ApplicationController
  def index
    @courses = Course.sort_by_created.paginate(page: params[:page])
  end

  def show
    @course = Course.find_by(id: params[:id])
    return if @course

    flash[:warning] = t "courses.not_found"
    redirect_to courses_path
  end

  def new
    check_exists_course
  end

  def edit
    check_exists_course
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def update
    @course = Course.find_by(id: params[:id])
    if @course&.update(course_params)
      redirect_to @course
    else
      flash[:warning] = t "courses.not_found"
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :image)
  end

  def check_exists_course
    @course = Course.find_by(id: params[:id])
    return if @course

    flash[:warning] = t "courses.not_found"
    redirect_to courses_path
  end
end
