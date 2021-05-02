class User < ApplicationRecord
  belongs_to :game
  has_many :user_loots
  has_many :loots, through: :user_loots
end
