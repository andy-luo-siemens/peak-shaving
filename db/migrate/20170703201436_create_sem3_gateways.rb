class CreateSem3Gateways < ActiveRecord::Migration[5.1]
  def change
    create_table :sem3_gateways do |t|
      t.macaddr :mac_address
      t.string :name
      t.references :peak_shaving_plan, foreign_key: true

      t.timestamps
    end
  end
end
