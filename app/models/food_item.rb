class FoodItem < ApplicationRecord
  has_many :ingredients
  has_many :food_items, through: :ingredients
end
