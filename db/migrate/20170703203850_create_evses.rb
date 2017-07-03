class CreateEvses < ActiveRecord::Migration[5.1]
  def change
    create_table :evses do |t|
      t.inet :ip_address
      t.string :name
      t.references :evse_gateway, foreign_key: true

      t.timestamps
    end
  end
end
