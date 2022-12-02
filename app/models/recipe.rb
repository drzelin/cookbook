class Recipe < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { minimum: 3 }
  validates :prep_time_in_mins, numericality: true
  validates :servings, numericality: true

  # Associations
  belongs_to :user

  has_many :directions

  # NOTE: didn't use a has_and_belongs_to_many relationship b/w food items and
  # recipes so we can add other columns to the ingredients table
  has_many :ingredients
  has_many :food_items, through: :ingredients

  # Nested Forms via Cocoon Gem
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  # Scopes
end
