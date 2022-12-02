class Ingredient < ApplicationRecord
  belongs_to :food_item
  belongs_to :recipe

  accepts_nested_attributes_for :food_item, reject_if: :all_blank, allow_destroy: true
end
