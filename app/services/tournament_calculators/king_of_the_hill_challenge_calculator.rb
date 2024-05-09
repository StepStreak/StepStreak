module TournamentCalculators
  class KingOfTheHillChallengeCalculator < TournamentChallengeCalculator
    def update_tournament_score
      if @challenge_user.score >= 7500 && !@challenge.king_appointed?
        points = 25

        @challenge.update(king_id: @challenge_user.tournament_participant_id,
                          king_score: @challenge_user.score, king_at: Time.current)

        @challenge_user.update(tournament_score: points)
      elsif @challenge_user.score >= 7500 && @challenge.king_id != @challenge_user.tournament_participant_id
        remaining_score = @challenge_user.score - @challenge.king_score

        return if remaining_score < 500

        points = (remaining_score / 500) + 15

        @challenge.update(king_id: @challenge_user.tournament_participant_id,
                          king_score: @challenge_user.score, king_at: Time.current)

        @challenge_user.increment!(:tournament_score, points)

      end

      super
    end
  end
end
