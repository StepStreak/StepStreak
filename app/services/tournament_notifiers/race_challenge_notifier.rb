module TournamentNotifiers
  class RaceChallengeNotifier
    def initialize(challenge)
      @challenge = challenge
    end

    def call(type)
      case type
      when :reminder
        send_reminder
      when :result
        send_result
      else
        # do nothing
      end
    end

    private
    def send_reminder
      @challenge.users.find_each do |user|
        Notification.create(user: user, title: "#{@challenge.title} ends tonight",
                            body: 'Do not forget to sync your steps to get your points calculated')
      end
    end

    def send_result
      @challenge.users.find_each do |user|
        Notification.create(user: user, title: "#{@challenge.title} just ended",
                            body: 'Check out the results to see how you did!')
      end
    end
  end
end
