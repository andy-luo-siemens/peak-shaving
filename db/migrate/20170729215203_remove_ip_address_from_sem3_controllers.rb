class RemoveIpAddressFromSem3Controllers < ActiveRecord::Migration[5.1]
  def change
    remove_column :sem3_controllers, :ip_address
  end
end
