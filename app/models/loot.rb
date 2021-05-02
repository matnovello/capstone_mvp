class Loot < ApplicationRecord
  belongs_to :room
  has_many :user_loots
  has_many :users, through: :user_loot
end
