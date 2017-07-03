class CreateTopologies < ActiveRecord::Migration[5.1]
  def change
    create_table :topologies do |t|
      t.string :name
      t.float :limit_threshold_kilowatt
      t.float :warning_threshold_kilowatt

      t.timestamps
    end
  end
end
