class AddFollowerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :follower_id, :integer, index: true
    add_foreign_key :users, :users, column: :follower_id
    
  end
end
