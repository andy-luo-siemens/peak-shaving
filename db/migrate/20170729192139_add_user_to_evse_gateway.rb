class AddUserToEvseGateway < ActiveRecord::Migration[5.1]
  def change
    add_reference :evse_gateways, :user, index: true
  end
end
