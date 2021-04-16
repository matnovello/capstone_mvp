class CreateBlobMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :blob_monsters do |t|
      t.string :name
      t.string :catch_phrase
      t.string :max_health
      t.string :attack
      t.string :defense

      t.timestamps
    end
  end
end
