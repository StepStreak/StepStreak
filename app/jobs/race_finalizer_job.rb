class RaceFinalizerJob < ApplicationJob
  def perform(challenge)
    TournamentCalculators::RaceChallengeFinalizer.new(challenge).call
  end
end