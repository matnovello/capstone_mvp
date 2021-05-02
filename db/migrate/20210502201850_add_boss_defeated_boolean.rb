class AddBossDefeatedBoolean < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :boss_defeated, :boolean
  end
end
