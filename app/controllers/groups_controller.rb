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
    @count = 0
    if params[:type] == 'next'
      @count = params[:count].to_i
      @count += 1
      change_month
      @task = Task.where('date LIKE(?) AND group_id LIKE(?)', "%#{@date.year}-#{collect_month}%", "%#{params[:id]}%")
    elsif params[:type] == 'pre'
      @count = params[:count].to_i
      @count -= 1
      change_month
      @task = Task.where('date LIKE(?) AND group_id LIKE(?)', "%#{@date.year}-#{collect_month}%", "%#{params[:id]}%")
    else
      @task = Task.where('date LIKE(?) AND group_id LIKE(?)', "%#{@date.year}-#{collect_month}%", "%#{params[:id]}%")
    end
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
    if @group.destroy
      redirect_to action: :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def collect_month
    if @date.month < 10
      "0#{@date.month}"
    else
      @date.month.to_s
    end
  end

  def change_month
    if @count >= 0
      @count.times do
        @date = @date.next_month
      end
    elsif @count.abs.times do
            @date = @date.prev_month
          end
    end
  end
end
