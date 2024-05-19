module TournamentNotifiers
  class MilestoneChallengeNotifier
    def initialize(challenge)
      @challenge = challenge
    end

    def call(type)
      case type
      when :result
        send_result
      else
        # do nothing
      end
    end

    private
    def send_result
      @challenge.notify_participants(title: '🏁 Milestone Challenge Over!',
                                      body: 'The Milestone Challenge has ended. Check the results and see who reached the goal first!')
    end
  end
end
