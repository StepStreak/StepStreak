class GoalsController < ApplicationController
  before_action :set_goal, only: [:index, :edit, :update]

  def index
    @user_progress = Overview::ActivitiesThisMonthQuery.call.sum(:steps)
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.month = "#{Date.current.month}/#{Date.current.year}"
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:target)
  end

  def set_goal
    @goal = current_user.goals.find_by(month: "#{Date.current.month}/#{Date.current.year}")
  end
end