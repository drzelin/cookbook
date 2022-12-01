class Recipe < ApplicationRecord
  validates :directions, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :prep_time_in_mins, numericality: true
  validates :servings, numericality: true

  belongs_to :user

  # NOTE: didn't use a has_and_belongs_to_many relationship b/w food items and
  # recipes so we can add other columns to the ingredients table
  has_many :ingredients
  has_many :food_items, through: :ingredients

  delegate :email, to: :user
end
