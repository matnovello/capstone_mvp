class AddMonsterIdToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :monster_id, :integer
  end
end
