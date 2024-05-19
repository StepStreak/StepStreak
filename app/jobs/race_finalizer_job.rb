class RaceFinalizerJob < ApplicationJob
  def perform(challenge)
    RaceChallengeFinalizer.new(challenge).call
  end
end