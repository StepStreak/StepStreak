class AddLastSyncAtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_sync_at, :datetime
  end
end
