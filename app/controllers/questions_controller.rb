class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      @questions = Question.find_by(lession_id: params[:id])
    else
      flash[:warning] = t "lessions.not_found"
      redirect_to courses_path
    end
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @answers = params.require(:answer)
    puts(@answers)
  end

  def update; end

  def destroy; end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :type, :answer, :right)
  end
end
