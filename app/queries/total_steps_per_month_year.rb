class TotalStepsPerMonthYear
  def self.call
    Activity.group_by_month_of_year(:date)
            .sum(:steps)
  end
end