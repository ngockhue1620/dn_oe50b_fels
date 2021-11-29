class LessionsCoursesController < ApplicationController
  def index
    @course = Course.find_by(id: params[:course_id])
    if @course.present?
      # tìm ra những bài học nằm trong khóa học
      @current_lession_of_course  = LessionsCourse.where(course: @course.id)
      # tìm ra những bài học chưa thuộc khóa học
      @lessions = Lession.where.not(id: @current_lession_of_course.pluck(:lession_id)).paginate(:page => params[:page], :per_page => 6)

    else
      redirect_to root_url
    end
  end

  def create
    if params[:lessions_course][:action] == "add"
      @math = LessionsCourse.new(lessions_course_params)
      if @math.save
        flash[:success] = t "mess.success"
        redirect_to "/lessions_courses?course_id=#{lessions_course_params['course_id']}"
      else
        flash[:success] = "có lỗi sãy ra"
      end

    else

      @math = LessionsCourse.where(course_id: lessions_course_params[:course_id], lession_id: lessions_course_params[:lession_id])
      if @math.size > 0
        @math[0].delete
        redirect_to "/lessions_courses?course_id=#{lessions_course_params['course_id']}"
      else
        flash[:success] = t "mess.have_error"
        redirect_to "/lessions_courses?course_id=#{lessions_course_params['course_id']}"
      end
    end

  end

  def update; end


  private

  def lessions_course_params
    params.require(:lessions_course).permit(:course_id, :lession_id)
  end
end
