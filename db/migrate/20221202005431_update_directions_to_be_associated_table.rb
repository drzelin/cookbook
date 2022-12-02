class UpdateDirectionsToBeAssociatedTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :directions

    create_table :directions do |t|
      t.belongs_to :recipe
      t.integer :step_number
      t.string :description
      t.timestamps
    end
  end
end
