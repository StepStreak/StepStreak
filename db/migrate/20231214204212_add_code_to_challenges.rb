class AddCodeToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :code, :string
  end
end
