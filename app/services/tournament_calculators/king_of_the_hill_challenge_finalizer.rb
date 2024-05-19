class TournamentCalculators::KingOfTheHillChallengeFinalizer
  def initialize(challenge)
    @challenge = challenge
    @challenge_user = ChallengeUser.find_by(id: challenge.current_king_id)
    @tournament_participant = @challenge_user.tournament_participant
  end

  def call
    calculate_king_points

    update_tournament_participant_score

    TournamentNotifiers::KingOfTheHillChallengeNotifier.new(@challenge).call(:result)
  end

  private

  def calculate_king_points
    current_king_points = (time_difference_in_minutes / 15) * 1

    @challenge_user.increment!(:tournament_score, current_king_points)
  end

  def update_tournament_participant_score
    total_tournament_score = @tournament_participant.challenge_users.sum(:tournament_score)

    @tournament_participant.update(score: total_tournament_score)
  end

  def time_difference_in_minutes
    ((@challenge.ends_at.to_time - @challenge.king_at.to_time).ceil / 60).to_i
  end
end