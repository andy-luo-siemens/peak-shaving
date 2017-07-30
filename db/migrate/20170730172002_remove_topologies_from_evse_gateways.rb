class RemoveTopologiesFromEvseGateways < ActiveRecord::Migration[5.1]
  def change
    remove_reference :evse_gateways, :topology, foreign_key: true
  end
end
