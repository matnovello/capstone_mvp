class ChangeInventoryToArray < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :inventory, :string
    add_column :users, :loot_cache, :integer, array: true
  end
end
