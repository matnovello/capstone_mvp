class AddLootCheckForMonster < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :has_loot, :boolean
  end
end
