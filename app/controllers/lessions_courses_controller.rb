class LessionsCoursesController < ApplicationController
  def index
    @lessions_courses = LessionsCourse.all
  end

  def show; end

  def new
    @lessions_course = LessionsCourse.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def set_lessions_course
    @lessions_course = LessionsCourse.find(params[:id])
  end

  def lessions_course_params
    params.require(:lessions_course).permit(:title)
  end
end
