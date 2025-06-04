class AddCfEdgeLocationToWebRequests < ActiveRecord::Migration[8.0]
  def change
    add_column :web_requests, :cf_edge_location, :string
  end
end
