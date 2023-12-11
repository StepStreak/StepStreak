class Top20StepsQuery
  def self.call
    Current.user.activities.order(steps: :desc).first(20)
  end
end

