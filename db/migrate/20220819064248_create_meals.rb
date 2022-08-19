class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.date :scheduled_on, null: false
      t.integer :kind, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
