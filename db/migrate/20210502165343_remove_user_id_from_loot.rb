class RemoveUserIdFromLoot < ActiveRecord::Migration[6.1]
  def change
    remove_column :loots, :user_id, :integer
  end
end
