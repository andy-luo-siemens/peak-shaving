class AddAddressToSem3Controllers < ActiveRecord::Migration[5.1]
  def change
    add_column :sem3_controllers, :address, :int
  end
end
