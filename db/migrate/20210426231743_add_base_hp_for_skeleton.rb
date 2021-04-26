class AddBaseHpForSkeleton < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :base_health, :integer
    add_column :users, :base_attack, :integer
  end
end
