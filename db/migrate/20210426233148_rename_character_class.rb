class RenameCharacterClass < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :class, :character_class
  end
end
