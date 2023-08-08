class AddHeartRateAndRestingHeartEateToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :heart_rate, :float, default: 0
    add_column :activities, :resting_heart_rate, :float, default: 0
  end
end
