class AddMaxHeartRateToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :max_heart_rate, :float, default: 0
  end
end
