class Loot < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true
  has_many :user_loots
  has_many :users, through: :user_loot
end
