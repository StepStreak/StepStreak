class MaxHeartRatePerDay
  def self.call(type, date)
    Overview::ActivitiesThisMonthQuery.call(date).group_by_day(:date, format: "%d").maximum(type)
  end
end



