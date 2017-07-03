class RemovePeakShavingPlanFromEvseGateway < ActiveRecord::Migration[5.1]
  def change
    remove_reference :evse_gateways, :peak_shaving_plan, foreign_key: true
  end
end
