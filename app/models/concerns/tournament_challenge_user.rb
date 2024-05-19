module TournamentChallengeUser
  extend ActiveSupport::Concern

  included do
    belongs_to :tournament_participant, optional: true

    after_create_commit :update_tournament_score, if: -> { challenge.tournament? }
    after_update_commit :update_tournament_score, if: -> { challenge.tournament? && saved_change_to_score? }

    delegate :update_tournament_score, to: :tournament_calculator
  end

  def tournament_calculator
    "TournamentCalculators::#{challenge.mode.camelize}ChallengeCalculator".constantize.new(self)
  end
end