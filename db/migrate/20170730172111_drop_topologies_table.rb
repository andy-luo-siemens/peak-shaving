class DropTopologiesTable < ActiveRecord::Migration[5.1]
  def up
    remove_reference :peak_shaving_plans, :topology, foreign_key: true
    drop_table :topologies
  end

  def dropdown
    raise ActiveRecord::IrreversibleMigration
  end
end
