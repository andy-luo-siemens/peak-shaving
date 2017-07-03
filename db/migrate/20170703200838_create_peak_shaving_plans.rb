class CreatePeakShavingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :peak_shaving_plans do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :topology, foreign_key: true
      t.timestamps
    end
  end
end
