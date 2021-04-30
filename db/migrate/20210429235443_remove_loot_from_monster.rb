class RemoveLootFromMonster < ActiveRecord::Migration[6.1]
  def change
    remove_column :monsters, :loot_id, :integer
    remove_column :loots, :monster_id, :integer
  end
end
