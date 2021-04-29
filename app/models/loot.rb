class Loot < ApplicationRecord
  belongs_to :room
  belongs_to :monster, optional: true
end
