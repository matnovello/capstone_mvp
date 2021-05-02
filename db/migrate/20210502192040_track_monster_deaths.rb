class TrackMonsterDeaths < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :vanquishCount, :integer
  end
end
