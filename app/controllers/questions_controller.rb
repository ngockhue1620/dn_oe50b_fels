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
    # transaction
    @add_question = Question.new(
      content: question_params[:content],
      typeQuestion: question_params[:typeQuestion].to_i,
      lession_id: question_params[:lession_id]
    )

    if @add_question.save
      puts(question_params[:answers])
      question_params[:answers].each_with_index { |content, index|
        if index == question_params[:right]
          Answer.create(content: content, is_right: true, question_id: @add_question.id)
        else
          Answer.create(content: content, is_right: false, question_id: @add_question.id)
        end
      }
    end
    redirect_to "/lessions/#{question_params[:lession_id]}"
  end

  def update; end

  def destroy; end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :typeQuestion, :right, :lession_id, answers: [ ])
  end
end
