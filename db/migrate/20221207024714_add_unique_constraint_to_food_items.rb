class AddUniqueConstraintToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_index :food_items, :name, unique: true
  end
end
