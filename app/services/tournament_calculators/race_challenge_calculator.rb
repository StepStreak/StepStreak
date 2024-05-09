module TournamentCalculators
  class RaceChallengeCalculator < TournamentChallengeCalculator
    def update_tournament_score
      points = @challenge_user.score / 100
      points += (@challenge_user.score / 5000) * 10

      @challenge_user.update(tournament_score: points)

      super
    end
  end
end
