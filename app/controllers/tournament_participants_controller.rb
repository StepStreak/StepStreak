class TournamentParticipantsController < ApplicationController
  def new
    @tournament_participant = current_user.tournament_participants.last
    redirect_to @tournament_participant.tournament if @tournament_participant && @tournament_participant.tournament.active?
  end

  def create
    @tournament = Tournament.active.find_by(code: params[:code])
    if @tournament
      @tournament_participant = TournamentParticipant.create(tournament: @tournament, user: current_user)
      redirect_to @tournament
    else
      flash[:alert] = 'Invalid tournament code'
      render :new, status: :unprocessable_entity
    end
  end
end