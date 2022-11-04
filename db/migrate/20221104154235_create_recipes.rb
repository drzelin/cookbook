class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.integer :servings
      t.integer :prep_time_in_mins

      t.timestamps
    end
  end
end
