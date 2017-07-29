class AddUserToTopology < ActiveRecord::Migration[5.1]
  def change
    add_reference :topologies, :user, index: true
  end
end
