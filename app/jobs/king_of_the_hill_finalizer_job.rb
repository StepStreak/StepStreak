class KingOfTheHillFinalizerJob < ApplicationJob
  def perform(challenge)
    TournamentCalculators::KingOfTheHillChallengeFinalizer.new(challenge).call
  end
end