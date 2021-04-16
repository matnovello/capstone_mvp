class Room < ApplicationRecord
  belongs_to :game
  has_one :blob_monsters
end
