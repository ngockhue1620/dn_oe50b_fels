class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
