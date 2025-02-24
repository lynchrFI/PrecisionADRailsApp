class User < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :clients, through: :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 6 }, presence: true 

    def self.create_with_omniauth(auth)
        user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
        user.email = "#{auth['uid']}@#{auth['provider']}.com"
        user.password = auth['uid']
        user.name = auth['info']['name']
        if User.exists?(user.id)
          user
        else
          user.save!
          user
        end
    end

end