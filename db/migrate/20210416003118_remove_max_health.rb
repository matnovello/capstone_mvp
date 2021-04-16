class RemoveMaxHealth < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :max_health, :integer
    add_column :users, :base_health, :integer
  end
end
