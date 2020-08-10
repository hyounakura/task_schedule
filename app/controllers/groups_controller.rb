class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy show]

  def index; end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @date = Date.today
    @wdays = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']
    @task = Task.where('date LIKE(?) AND group_id LIKE(?)', "%#{Date.today.year}-#{collect_month}%", "%#{params[:id]}%")
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to action: :index
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def collect_month
    if Date.today.month < 10
      "0#{Date.today.month}"
    else
      Date.today.month.to_s
    end
  end
end
