class TotalStepsPerYear
  def self.call
    Current.user.activities.group_by_year(:date).sum(:steps)
  end
end