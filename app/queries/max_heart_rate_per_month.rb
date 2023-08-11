class MaxHeartRatePerMonth
  def self.call(type)
    Activity.group_by_month(:date).maximum(type)
  end
end

