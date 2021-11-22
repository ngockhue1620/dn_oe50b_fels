class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
