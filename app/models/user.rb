class User < ApplicationRecord
  belongs_to :game
  has_one :user_loot
  has_many :loots, through: :user_loot

end
