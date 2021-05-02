class CreateUserLoots < ActiveRecord::Migration[6.1]
  def change
    create_table :user_loots do |t|
      t.integer :user_id
      t.integer :loot_id
      t.integer :quantity
      t.timestamps
    end
  end
end
