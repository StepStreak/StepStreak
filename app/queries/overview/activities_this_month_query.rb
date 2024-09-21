module Overview
  class ActivitiesThisMonthQuery
    def self.call(date = nil)
      date = date.present? ? Date.strptime(date, '%Y-%m') : Date.current

      beginning_of_month = date.beginning_of_month
      end_of_month = date.end_of_month

      ActivitiesInPeriodQuery.call(beginning_of_month, end_of_month)
    end
  end
end