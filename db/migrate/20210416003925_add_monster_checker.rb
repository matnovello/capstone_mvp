class AddMonsterChecker < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :has_monster?, :boolean
  end
end
