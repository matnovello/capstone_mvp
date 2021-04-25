class AddDeadChecker < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :is_dead, :boolean
  end
end
