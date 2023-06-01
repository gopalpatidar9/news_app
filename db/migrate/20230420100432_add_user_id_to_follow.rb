class AddUserIdToFollow < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :user_id, :integer
  end
end
