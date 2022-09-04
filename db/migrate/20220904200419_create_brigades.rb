class CreateBrigades < ActiveRecord::Migration[7.0]
  def change
    create_table :brigades do |t|
      t.string :name
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
