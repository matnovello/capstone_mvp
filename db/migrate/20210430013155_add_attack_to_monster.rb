class AddAttackToMonster < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :base_attack, :integer
  end
end

x
