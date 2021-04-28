class CreateLootStashes < ActiveRecord::Migration[6.1]
  def change
    create_table :loot_stashes do |t|
      t.integer :user_id
      t.integer :loot_id

      t.timestamps
    end
  end
end
