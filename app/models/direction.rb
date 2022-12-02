class Direction < ApplicationRecord
  belongs_to :recipe

  before_create :update_step_number

  private

  def update_step_number
    self.step_number = recipe.directions.count + 1
  end
end
