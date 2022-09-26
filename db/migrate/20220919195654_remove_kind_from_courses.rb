class RemoveKindFromCourses < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :kind
  end
end
