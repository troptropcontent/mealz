class RemoveUserReferenceFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :guests, :user
  end
end
