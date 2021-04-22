class Room < ApplicationRecord
  belongs_to :game
  has_one :monster
end
