class AddMonsterAtts < ActiveRecord::Migration[6.1]
  def change
    add_column :blob_monsters, :max_health, :integer
    add_column :blob_monsters, :attack, :integer
    add_column :blob_monsters, :defense, :integer
  end
end
