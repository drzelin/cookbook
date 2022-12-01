class Recipe < ApplicationRecord
  validates :directions, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :prep_time_in_mins, numericality: true
  validates :servings, numericality: true

  belongs_to :user

  delegate :email, to: :user
end
