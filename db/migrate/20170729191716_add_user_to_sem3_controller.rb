class AddUserToSem3Controller < ActiveRecord::Migration[5.1]
  def change
    add_reference :sem3_controllers, :user, foreign_key: true
  end
end
