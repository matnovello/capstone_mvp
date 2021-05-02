class ChangeTheDamnCaseShit < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :vanquishCount, :integer
    add_column :users, :monsters_defeated, :integer
  end
end
