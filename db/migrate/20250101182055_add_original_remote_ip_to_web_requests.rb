class AddOriginalRemoteIpToWebRequests < ActiveRecord::Migration[8.0]
  def change
    add_column :web_requests, :original_remote_ip, :string
    add_column :web_requests, :forwarded_ip, :string
  end
end
