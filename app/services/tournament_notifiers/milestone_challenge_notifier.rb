module TournamentNotifiers
  class MilestoneChallengeNotifier
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
        Notification.create(user: user, title: "#{@challenge.title} is still on!",
                            body: 'Do you have what it takes to win?')
      end
    end

    def send_result
      @challenge.users.find_each do |user|
        Notification.create(user: user, title: "#{@challenge.title}'s goal has been reached!",
                            body: 'Check out the results to see how you did!')
      end
    end
  end
end
