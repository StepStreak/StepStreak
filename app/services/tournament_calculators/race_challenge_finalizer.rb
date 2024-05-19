class TournamentCalculators::RaceChallengeFinalizer
  def initialize(challenge)
    @challenge = challenge
  end

  def call
    TournamentNotifiers::RaceChallengeNotifier.new(@challenge).call(:result)
  end
end