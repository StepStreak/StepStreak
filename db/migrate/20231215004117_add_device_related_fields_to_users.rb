class AddDeviceRelatedFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :device_type, :integer
    add_column :users, :notification_token, :string
  end
end
