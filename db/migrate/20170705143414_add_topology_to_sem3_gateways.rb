class AddTopologyToSem3Gateways < ActiveRecord::Migration[5.1]
  def change
    add_reference :sem3_gateways, :topology, foreign_key: true
  end
end
