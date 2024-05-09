module TournamentCalculators
  class TournamentChallengeCalculator
    def initialize(challenge_user)
      @challenge_user = challenge_user
      @challenge = challenge_user.challenge
    end

    def update_tournament_score
      tournament_participant = @challenge_user.tournament_participant

      tournament_participant.update(score: tournament_participant.challenge_users.sum(:tournament_score))
    end
  end
end