class User < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :clients, through: :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 6 }, presence: true 


end