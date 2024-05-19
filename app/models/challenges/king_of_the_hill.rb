module Challenges
  class KingOfTheHill
    def initialize(challenge)
      @challenge = challenge
    end

    def schedule_finalizer_job
      KingOfTheHillFinalizerJob.set(wait_until: @challenge.ends_at + 10.seconds).perform_later(@challenge.id)
    end
  end
end