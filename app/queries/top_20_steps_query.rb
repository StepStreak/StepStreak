class Top20StepsQuery
  def self.call
    Activity.order(steps: :desc).first(20)
  end
end

