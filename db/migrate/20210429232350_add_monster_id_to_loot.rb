class AddMonsterIdToLoot < ActiveRecord::Migration[6.1]
  def change
    add_column :loots, :monster_id, :integer
  end
end
