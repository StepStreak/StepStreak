module Overview
  class ActivitiesInPeriodQuery
    def self.call(from, to)
      Activity.where(date: from..to)
    end
  end
end