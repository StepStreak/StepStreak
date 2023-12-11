class TotalStepsPerMonth
  def self.call
    Current.user.activities.group_by_month(:date).sum(:steps)
  end
end