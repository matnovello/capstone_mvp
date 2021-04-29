class AddLootToMonster < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :loot_id, :integer
  end
end
