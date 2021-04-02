class AddGameId < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :game_id, :integer
  end
end
