class AddDeletedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :deleted, :boolean, null: false, default: false
  end
end
