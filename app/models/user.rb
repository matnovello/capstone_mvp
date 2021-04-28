class User < ApplicationRecord
  has_many :loots, through: :loot_stashes
  belongs_to :game
end
