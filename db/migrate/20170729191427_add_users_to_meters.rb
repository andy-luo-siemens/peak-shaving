class AddUsersToMeters < ActiveRecord::Migration[5.1]
  def change
    add_reference :meters, :user, index: true
  end
end
