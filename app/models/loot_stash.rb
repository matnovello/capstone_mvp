class LootStash < ApplicationRecord
  has_one :user
  has_many :loots
end
