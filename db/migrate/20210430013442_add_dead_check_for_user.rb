class AddDeadCheckForUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_dead, :boolean
  end
end
