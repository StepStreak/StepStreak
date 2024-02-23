class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find_by(id: params[:id])
  end
end