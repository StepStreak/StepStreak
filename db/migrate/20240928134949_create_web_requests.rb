class CreateWebRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :web_requests do |t|
      t.string :user_email
      t.string :remote_ip
      t.string :controller_class
      t.string :original_path
      t.string :method
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
