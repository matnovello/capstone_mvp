class AddLootToRoomsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :loot_id, :integer
  end
end
