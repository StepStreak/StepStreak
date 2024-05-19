module Challenges
  class Milestone
    def initialize(challenge)
      @challenge = challenge
    end

    def schedule_finalizer_job
      MilestoneFinalizerJob.set(wait_until: @challenge.ends_at + 10.seconds).perform_later(@challenge)
    end
  end
end