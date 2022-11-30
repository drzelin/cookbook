class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :directions, presence: true
end
