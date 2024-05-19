class ChallengeReminderJob < ApplicationJob
  def perform(challenge)
    challenge.notify_participants(title: "#{challenge.title} is ending soon!",
                                  body: 'Just 5 hours left! Keep moving to complete your challenge. You got this! 💪')
  end
end