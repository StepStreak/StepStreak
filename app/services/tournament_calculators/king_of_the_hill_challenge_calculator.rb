module TournamentCalculators
  class KingOfTheHillChallengeCalculator < TournamentChallengeCalculator
    def update_tournament_score
      if @challenge_user.score >= 2500 && !@challenge.king_appointed?
        points = 25

        @challenge.update(current_king_id: @challenge_user.tournament_participant_id,
                          king_score: @challenge_user.score, king_at: Time.current)

        @challenge_user.update(tournament_score: points)
      elsif @challenge_user.score >= 2500 && @challenge.current_king_id != @challenge_user.tournament_participant_id
        remaining_score = @challenge_user.score - @challenge.king_score

        return if remaining_score < 500

        current_king_points = (time_difference_in_minutes / 15) * 1
        current_king_id = @challenge.current_king_id

        tournament_participant = TournamentParticipant.find_by(id: @challenge.current_king_id)
                             .challenge_users.find_by(challenge_id: @challenge.id)
                             .increment!(:tournament_score, current_king_points)

        tournament_participant.update(score: tournament_participant.challenge_users.sum(:tournament_score))

        new_king_points = (remaining_score / 500) + 15

        @challenge.update(current_king_id: @challenge_user.tournament_participant_id,
                          last_king_id: current_king_id,
                          king_score: @challenge_user.score, king_at: Time.current)

        @challenge_user.increment!(:tournament_score, new_king_points)
      end

      super

      if @challenge.current_king_id.present?
        TournamentNotifiers::KingOfTheHillChallengeNotifier.new(@challenge).call(:new_king_appointed)
      end
    end

    private

    def time_difference_in_minutes
      ((Time.current - @challenge.king_at.to_time).ceil / 60).to_i
    end
  end
end
