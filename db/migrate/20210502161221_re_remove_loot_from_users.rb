class ReRemoveLootFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :loot_stash, :string
  end
end
