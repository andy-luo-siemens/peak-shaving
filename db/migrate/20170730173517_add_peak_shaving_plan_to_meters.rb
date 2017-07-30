class AddPeakShavingPlanToMeters < ActiveRecord::Migration[5.1]
  def change
    add_reference :meters, :peak_shaving_plans, index: true
  end
end
