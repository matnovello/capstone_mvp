class AddHealthToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :max_health, :integer
  end
end
