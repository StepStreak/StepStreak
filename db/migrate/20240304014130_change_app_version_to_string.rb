class ChangeAppVersionToString < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :app_version, :string, default: '0.0'
  end
end
