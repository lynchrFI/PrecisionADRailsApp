class Client < ApplicationRecord

    has_many :appointments
    has_many :users, through: :appointments

    validates :name, presence: true
    validates :age, numericality: true
    validates :phone_number, presence: true
    validates :phone_number, length: { is: 10 }
    validates :email, presence: true, uniqueness: true 
    validates :vehicle, presence: true
    validates :vehicle_type, presence: true

end
