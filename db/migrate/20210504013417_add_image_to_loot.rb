class AddImageToLoot < ActiveRecord::Migration[6.1]
  def change
    add_column :loots, :image, :string
  end
end
