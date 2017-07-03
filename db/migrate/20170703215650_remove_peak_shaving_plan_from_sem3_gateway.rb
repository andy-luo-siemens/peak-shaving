class RemovePeakShavingPlanFromSem3Gateway < ActiveRecord::Migration[5.1]
  def change
    remove_reference :sem3_gateways, :peak_shaving_plan, foreign_key: true
  end
end
