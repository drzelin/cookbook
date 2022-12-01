class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.belongs_to :food_item
      t.belongs_to :recipe
      t.integer :amount
      t.string :unit
      t.timestamps
    end
  end
end
