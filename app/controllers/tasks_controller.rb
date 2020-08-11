class TasksController < ApplicationController
  before_action :set_group, only: %i[new create edit update destroy]
  before_action :set_task, only: %i[edit update destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to group_path(@task.group_id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to group_path(@task.group_id)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to group_path(@task.group_id)
  end

  private

  def task_params
    params.require(:task).permit(:date, :name, :start_time_id, :end_time_id, :content, user_ids: []).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
