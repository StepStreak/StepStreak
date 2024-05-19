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

      Notification.create(user: current_king, title: "🎉 You're the New King!",
                          body: "Congratulations! You've claimed the throne. Keep stepping to defend your crown and earn extra points!")

      return if @challenge.last_king_id.nil?

      old_king = ChallengeUser.find_by(id: @challenge.last_king_id).user

      Notification.create(user: old_king, title: "😮 You've Been Dethroned!",
                          body: 'Another participant has outstepped you and taken the crown. Keep stepping to reclaim the throne and boost your points!')
    end

    def send_result
      @challenge.notify_participants(title: '🏔️ King of the Hill Challenge Over!',
                                      body: 'The King of the Hill Challenge has ended. Check the leaderboard to see who held the throne the longest and won the most points!')
    end
  end
end
