class AnswersController < ApplicationController
  before_action :is_admin?
  private

  def validate_user
    unless is_admin?
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end

  def answer_params
    params.require(:answer).permit(:title)
  end
end
