class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find_by(id: params[:id])
    @tournament_participants = @tournament
                                 .tournament_participants
                                 .select('*, RANK() OVER (ORDER BY score DESC) as rank')
                                 .preload(:user)

    @current_participant = @tournament_participants.find { |tp| tp.user == current_user }

    @current_challenge = @tournament.challenges.active.first

    @winner = @tournament_participants.first
  end
end