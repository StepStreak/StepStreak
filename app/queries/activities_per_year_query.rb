class ActivitiesPerYearQuery
  def self.call(steps_count)
    Activity.group_by_year(:date)
            .where('steps > ?', steps_count)
            .count
  end
end