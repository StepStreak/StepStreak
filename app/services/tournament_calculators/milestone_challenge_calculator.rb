module TournamentCalculators
  class MilestoneChallengeCalculator < TournamentChallengeCalculator
    def update_tournament_score
      return if @challenge_user.score < @challenge.goal

      points = 50

      @challenge_user.update(tournament_score: points)

      @challenge.update(finished: true)

      super
    end
  end
end
