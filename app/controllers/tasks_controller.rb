class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update delete]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@tasks)
  end

  def delete
    @task.delete
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :checkbox_value)
  end

end
