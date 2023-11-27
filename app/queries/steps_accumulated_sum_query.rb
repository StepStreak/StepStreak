class StepsAccumulatedSumQuery
  def self.call
    result = TotalStepsPerMonth.call

    cumulative_sum = 0
    result.transform_values! { |v| cumulative_sum += v }
  end
end
