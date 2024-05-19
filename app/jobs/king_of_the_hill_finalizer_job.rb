class KingOfTheHillFinalizerJob < ApplicationJob
  def perform(challenge)
    KingOfTheHillChallengeFinalizer.new(challenge).call
  end
end