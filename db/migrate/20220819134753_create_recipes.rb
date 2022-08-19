class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :course, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.float :quantity, null: false

      t.timestamps
    end
  end
end
