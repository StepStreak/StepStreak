class DashboardController < ApplicationController
  def index
    @top_20_steps = Top20StepsQuery.call
  end
end