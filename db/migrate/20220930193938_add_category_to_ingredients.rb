class AddCategoryToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :category, :integer, null: false, default: 0
  end
end
