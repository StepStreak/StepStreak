class TotalStepsPerYear
  def self.call
    Activity.group_by_year(:date)
            .sum(:steps)
  end
end