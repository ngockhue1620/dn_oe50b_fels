class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    puts("toi dádasd",request.url)
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = t "mess.sign_in_success"
      redirect_to "/lessions/#{task_params['lession_id']}"
    else
      flash[:success] = "có lỗi sãy ra"
    end
  end

  def update; end

  def destroy; end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :lession_id)
  end
end
