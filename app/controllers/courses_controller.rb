class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
    if @course.present?
      @course
    else
      flash[:warning] = t "courses.not_found"
    end
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find_by(id: params[:id])
    return  @course
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

    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy; end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
