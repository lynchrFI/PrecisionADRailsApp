class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.integer :phone_number
      t.string :email
      t.string :vehicle
      t.string :vehicle_type
    end
  end
end
