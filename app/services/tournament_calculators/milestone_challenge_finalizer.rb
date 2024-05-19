class TournamentCalculators::MilestoneChallengeFinalizer
  def initialize(challenge)
    @challenge = challenge
  end

  def call
    TournamentNotifiers::MilestoneChallengeNotifier.new(@challenge).call(:result)
  end
end