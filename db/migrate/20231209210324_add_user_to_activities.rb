class AddUserToActivities < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_reference :activities, :user, index: { algorithm: :concurrently }

    add_foreign_key :activities, :users, validate: false
    change_column_null :activities, :user_id, false
  end
end
