class RemoveVehicles < ActiveRecord::Migration[6.0]
  def change
    drop_table :vehicles
  end
end
