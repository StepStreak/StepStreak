class MilestoneFinalizerJob < ApplicationJob
  def perform(challenge)
    MilestoneChallengeFinalizer.new(challenge).call
  end
end