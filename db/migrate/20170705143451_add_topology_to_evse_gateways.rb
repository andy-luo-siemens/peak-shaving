class AddTopologyToEvseGateways < ActiveRecord::Migration[5.1]
  def change
    add_reference :evse_gateways, :topology, foreign_key: true
  end
end
