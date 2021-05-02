class UserLoot < ApplicationRecord
  belongs_to :user
  belongs_to :loot
end
