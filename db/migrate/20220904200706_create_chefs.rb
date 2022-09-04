class CreateChefs < ActiveRecord::Migration[7.0]
  def change
    create_table :chefs do |t|
      t.references :brigade, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
