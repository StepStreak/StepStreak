class TotalStepsPerMonth
  def self.call
    Activity.group_by_month(:date)
            .sum(:steps)
  end
end