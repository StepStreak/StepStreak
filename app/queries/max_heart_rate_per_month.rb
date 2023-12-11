class MaxHeartRatePerMonth
  def self.call(type)
    Current.user.activities.group_by_month(:date).maximum(type)
  end
end

