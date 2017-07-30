class RemoveTopologiesFromSem3Gateway < ActiveRecord::Migration[5.1]
  def change
    remove_reference :sem3_gateways, :topology, foreign_key: true
  end
end
