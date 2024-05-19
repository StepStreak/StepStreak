class MilestoneFinalizerJob < ApplicationJob
  def perform(challenge)
    TournamentCalculators::MilestoneChallengeFinalizer.new(challenge).call
  end
end