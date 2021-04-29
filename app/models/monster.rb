class Monster < ApplicationRecord
  belongs_to :room
  has_one :loot
end
