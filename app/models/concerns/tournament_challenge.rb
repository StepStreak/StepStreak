module TournamentChallenge
  extend ActiveSupport::Concern

  included do
    store :states, accessors: %i[current_king_id last_king_id king_at king_score], coder: JSON

    belongs_to :tournament, optional: true

    scope :standalone, -> { where(tournament_id: nil) }

    delegate :schedule_finalizer_job, to: :challenge_type_class

    after_create_commit :schedule_finalizer_job, if: :tournament?
  end

  def standalone?
    tournament_id.nil?
  end

  def tournament?
    !standalone?
  end

  def king_appointed?
    !!current_king_id
  end

  def challenge_type_class
    "Challenges::#{mode.to_s.camelize}".constantize.new(self)
  end
end