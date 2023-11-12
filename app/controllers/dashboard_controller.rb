class DashboardController < ApplicationController
  def index
  end

  def show
    @top_20_steps = Top20StepsQuery.call
  end
end