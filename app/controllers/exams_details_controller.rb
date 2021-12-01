class ExamsDetailsController < ApplicationController
  def show
    @exam = Exam.find_by(id: params[:id])
    if @exam.present?
      @question_of_exam = ExamDetail.where(exam_id: params[:id])
      @question_id_in_exam = []
      @question_of_exam.each do |question|
        @question_id_in_exam.push question.question
      end
      @list_question = Question.where(id: @question_id_in_exam).includes(:answers)
    else
      flash[:warning] = t "mess.have_error"
    end
  end
end
