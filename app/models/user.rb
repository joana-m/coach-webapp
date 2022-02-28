class User < ApplicationRecord
  has_many :coach_session
  has_many :bookings

  validates :user_name, :email_address, :phone_number, presence: true
  validates :user_name, :email_address, :phone_number, uniqueness: true
  validates :user_name, length: { minimum: 4 }
  validates :user_name, length: { maximum: 50 }
end

# User.create(user_name:"Nasimul", email_address:"nasimulrahman@gmail.com", phone_number:"0123456789").valid?
