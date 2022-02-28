class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :coach_session, dependent: :destroy

  validates :total_amount, :date_start, :date_end, presence: true
end
