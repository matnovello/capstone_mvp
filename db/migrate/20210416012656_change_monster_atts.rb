class ChangeMonsterAtts < ActiveRecord::Migration[6.1]
  def change
    remove_column :blob_monsters, :max_health, :integer
    remove_column :blob_monsters, :attack, :integer
    remove_column :blob_monsters, :defense, :integer
  end
end
