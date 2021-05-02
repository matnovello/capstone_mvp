class AddUserIdToLoot < ActiveRecord::Migration[6.1]
  def change
    add_column :loots, :user_id, :integer
  end
end
