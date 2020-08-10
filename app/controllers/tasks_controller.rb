class TasksController < ApplicationController
  def new
    @task = Task.new
    @group = Group.find(params[:group_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to group_path(@task.group_id)
    else
      @group = Group.find(params[:group_id])
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:date, :name, :start_time_id, :end_time_id, :content, user_ids: []).merge(group_id: params[:group_id])
  end
end
