class CreateManualNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :manual_notifications do |t|
      t.string :title
      t.string :body
      t.integer :device_type, default: 0

      t.timestamps
    end
  end
end
