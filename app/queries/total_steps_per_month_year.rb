class TotalStepsPerMonthYear
  def self.call
    Current.user.activities.group_by_month_of_year(:date).sum(:steps)
  end
end