class AddThresholdsToPeakShavingPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :peak_shaving_plans, :warning_threshold, :float
    add_column :peak_shaving_plans, :cutoff_threshold, :float
  end
end
