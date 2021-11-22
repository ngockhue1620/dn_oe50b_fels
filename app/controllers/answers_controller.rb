class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show; end

  def new
    @answer = Answer.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title)
  end
end
