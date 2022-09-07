class AddBrigadeReferencesToMeals < ActiveRecord::Migration[7.0]
  def change
    add_reference :meals, :brigade, null: true, foreign_key: true
  end
end
