module Overview
  class ActivitiesInPeriodQuery
    def self.call(from, to)
      Current.user.activities.where(date: from..to)
    end
  end
end