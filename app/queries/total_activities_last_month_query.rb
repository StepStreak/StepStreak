class TotalActivitiesLastMonthQuery
  def self.call(activity:)
    beginning_of_last_month = Date.current.last_month.beginning_of_month
    end_of_last_month = Date.current.last_month.end_of_month

    steps_per_month = Activity.where('date >= ? AND date <= ?', beginning_of_last_month, end_of_last_month)
            .sum(activity)

    steps_per_month
  end
end