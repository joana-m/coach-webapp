class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :coach_session
end
