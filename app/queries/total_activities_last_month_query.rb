class TotalActivitiesLastMonthQuery
  def self.call(activity:)
    last_month = (Date.current - 1.month)

    steps_per_month = Activity.where('date >= ?', last_month)
            .sum(activity)

    steps_per_month
  end
end