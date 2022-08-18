class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.references :user, null: true, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :nickname, null: false

      t.timestamps
    end
  end
end
