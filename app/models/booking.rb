class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :coach_session
  validates :date_start, :date_end, numericality: true
end
