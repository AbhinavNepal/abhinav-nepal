class RemoveUserReferenceFromPeople < ActiveRecord::Migration[5.2]

  def change
    # Association added in error.
    # Person is already referenced in user.
    remove_reference :people, :user, index: true, foreign_key: true
  end

end
