class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :start_on
      t.date :end_on
      t.string :name

      t.timestamps
    end
  end
end
