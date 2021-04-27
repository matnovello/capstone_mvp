class Room < ApplicationRecord
  belongs_to :game
  has_one :monster
  has_one :loot
end
