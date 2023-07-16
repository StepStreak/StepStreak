class TotalActivitiesCurrentMonthQuery
  def self.call(activity:)
    beginning_of_month = Date.current.beginning_of_month

    steps_per_month = Activity.where('date >= ?', beginning_of_month)
                              .sum(activity)

    steps_per_month
  end
end