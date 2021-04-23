class DestroyMonstreBoolean < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :has_monster?, :boolean
    add_column :rooms, :has_monster, :boolean
  end
end
