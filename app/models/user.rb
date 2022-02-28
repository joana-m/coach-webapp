class User < ApplicationRecord
  has_many :coach_session
  has_many :bookings

  validates :user_name, :email_address, :phone_number, presence: true
  validates :user_name, :email_address, :phone_number, uniqueness: true
  validates :user_name, length: { minimum: 10 }
end
