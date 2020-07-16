class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :user_id
      t.integer :client_id
      t.string :notes
    end
  end
end
