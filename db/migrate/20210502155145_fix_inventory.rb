class FixInventory < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :loot_cache, :integer
    add_column :users, :loot_stash, :string, array: true
  end
end
