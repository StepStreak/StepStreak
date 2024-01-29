class AddAppVersionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :app_version, :float, default: 0.0
  end
end
