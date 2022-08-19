class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :meal, null: false, foreign_key: true
      t.text :description
      t.string :name, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
