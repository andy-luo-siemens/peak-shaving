class CreateSem3Controllers < ActiveRecord::Migration[5.1]
  def change
    create_table :sem3_controllers do |t|
      t.inet :ip_address
      t.string :name
      t.references :sem3_gateway, foreign_key: true

      t.timestamps
    end
  end
end
