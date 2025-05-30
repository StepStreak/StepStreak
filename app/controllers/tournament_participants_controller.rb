class TournamentParticipantsController < ApplicationController
  def new
    @tournament_participant = current_user.tournament_participants.last
    redirect_to @tournament_participant.tournament if @tournament_participant && @tournament_participant.tournament.active?
  end

  def create
    @tournament = Tournament.active.find_by(code: params[:code].downcase)
    if @tournament
      @tournament_participant = TournamentParticipant.create(tournament: @tournament, user: current_user)
      redirect_to @tournament
    else
      flash[:alert] = t('.errors.invalid_code')
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @tournament = Tournament.find_by(id: params[:tournament_id])

    @tournament_participant = @tournament.tournament_participants.find_by(id: params[:id])
    @tournament_participant&.destroy

    redirect_to settings_path
  end
end