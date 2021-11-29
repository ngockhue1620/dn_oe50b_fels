class CoursesController < ApplicationController
  def index
    @courses = Course.paginate(:page => params[:page], :per_page => 6)
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
    if @course.present?
      @course
    else
      flash[:warning] = t "courses.not_found"
    end
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

  def destroy
    @course = Course.find_by(id: params[:id])
    if @course.present?
      if @course.delete
        flash[:success] =  t "mess.success"
        redirect_to courses_path
      else
        flash[:danger] = t "mess.have_error"
        redirect_to courses_path
      end
    else
      flash[:danger] = t "courses.not_found"
      redirect_to courses_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :image)
  end
end
