class AddBossChecker < ActiveRecord::Migration[6.1]
  def change
    remove_column :monsters, :boss_defeated, :boolean
    add_column :monsters, :is_boss, :boolean
  end
end
