module Overview
  class ActivitiesThisMonthQuery
    def self.call
      ActivitiesInPeriodQuery.call(Date.current.beginning_of_month, Date.current.end_of_month)
    end
  end
end