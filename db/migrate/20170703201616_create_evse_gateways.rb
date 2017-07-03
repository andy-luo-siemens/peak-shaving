class CreateEvseGateways < ActiveRecord::Migration[5.1]
  def change
    create_table :evse_gateways do |t|
      t.macaddr :mac_address
      t.string :name
      t.references :peak_shaving_plan, foreign_key: true

      t.timestamps
    end
  end
end
