class AddRoomIdToMonster < ActiveRecord::Migration[6.1]
  def change
    add_column :blob_monsters, :room_id, :integer
  end
end
