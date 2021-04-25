class AddHasEscapedToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :has_escaped, :boolean
  end
end
