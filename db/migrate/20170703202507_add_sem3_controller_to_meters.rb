class AddSem3ControllerToMeters < ActiveRecord::Migration[5.1]
  def change
    add_reference :meters, :sem3_controller, foreign_key: true
  end
end
