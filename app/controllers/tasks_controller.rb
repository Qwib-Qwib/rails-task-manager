class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @completion_message = case @task.completed
                          when true then 'completed'
                          when false then 'not completed'
                          end
  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.create(task_params)
    redirect_to task_path(@new_task)
  end

  def edit
    @edited_task = Task.find(params[:id])
  end

  def update
    @edited_task = Task.find(params[:id])
    @edited_task.update(task_params)
    redirect_to task_path(@edited_task)
  end

  def destroy
    @destroyed_task = Task.find(params[:id])
    @destroyed_task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
