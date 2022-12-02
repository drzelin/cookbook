class UpdateIngredientAmountToBeFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :ingredients, :amount, :float
  end
end
