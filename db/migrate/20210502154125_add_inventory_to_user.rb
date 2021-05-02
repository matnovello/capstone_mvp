class AddInventoryToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :inventory, :string
  end
end
