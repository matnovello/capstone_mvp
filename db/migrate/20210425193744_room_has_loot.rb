class RoomHasLoot < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :has_loot, :boolean
  end
end
