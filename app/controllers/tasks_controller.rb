class TasksController < ApplicationController
  before_action :validate_user, only: [:create]
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = t "mess.success"
      redirect_to "/lessions/#{task_params['lession_id']}"
    else
      flash[:success] = "có lỗi sãy ra"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :lession_id)
  end

  def validate_user
    unless is_admin?
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end
end
