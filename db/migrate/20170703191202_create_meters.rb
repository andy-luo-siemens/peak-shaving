class CreateMeters < ActiveRecord::Migration[5.1]
  def change
    create_table :meters do |t|
      t.integer :address
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
