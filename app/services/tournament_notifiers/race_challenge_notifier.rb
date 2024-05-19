module TournamentNotifiers
  class RaceChallengeNotifier
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
      @challenge.notify_participants(title: '🏁 Race Challenge Complete!',
                                     body: 'The Race Challenge has ended. Check the leaderboard to see how you placed and how many points you earned!')
    end
  end
end
