class AddUserToEvse < ActiveRecord::Migration[5.1]
  def change
    add_reference :evses, :user, index: true
  end
end
