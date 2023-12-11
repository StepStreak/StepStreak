module Overview
  class ActivitiesLastMonthQuery
    def self.call
      ActivitiesInPeriodQuery.call(1.month.ago.beginning_of_month, 1.month.ago.end_of_month)
    end
  end
end