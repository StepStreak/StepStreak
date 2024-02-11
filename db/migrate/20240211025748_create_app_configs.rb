class CreateAppConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :app_configs do |t|
      t.integer :app
      t.string :version

      t.timestamps
    end
  end
end
