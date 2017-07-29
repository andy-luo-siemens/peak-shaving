class AddUserToSem3Gateway < ActiveRecord::Migration[5.1]
  def change
    add_reference :sem3_gateways, :user, index: true
  end
end
