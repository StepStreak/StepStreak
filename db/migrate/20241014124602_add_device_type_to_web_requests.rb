class AddDeviceTypeToWebRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :web_requests, :device_type, :integer, default: 2
    add_column :web_requests, :app_version, :string
  end
end
