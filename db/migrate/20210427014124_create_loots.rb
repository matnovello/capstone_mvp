class CreateLoots < ActiveRecord::Migration[6.1]
  def change
    create_table :loots do |t|
      t.string :name
      t.string :description
      t.integer :room_id

      t.timestamps
    end
  end
end
