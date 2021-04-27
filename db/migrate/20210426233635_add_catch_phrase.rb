class AddCatchPhrase < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :catch_phrase, :string
  end
end
