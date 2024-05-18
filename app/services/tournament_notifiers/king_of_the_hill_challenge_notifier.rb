module TournamentNotifiers
  class KingOfTheHillChallengeNotifier
    def initialize(challenge)
      @challenge = challenge
    end

    def call(type)
      case type
      when :new_king_appointed
        send_new_king_appointed
      when :result
        send_result
      else
        # do nothing
      end
    end

    private

    def send_new_king_appointed
      current_king = ChallengeUser.find_by(id: @challenge.current_king_id).user

      Notification.create(user: current_king, title: 'You are the new king!',
                          body: 'You have been appointed as the new king of the hill')

      return if @challenge.last_king_id.nil?

      old_king = ChallengeUser.find_by(id: @challenge.last_king_id).user

      Notification.create(user: old_king, title: 'You have been dethroned!',
                          body: 'You have been dethroned as the king of the hill')
    end

    def send_result
      @challenge.users.find_each do |user|
        Notification.create(user: user, title: 'King of the hill has ended',
                            body: 'Check out the results to see how you did!')
      end
    end
  end
end
