class Booking < ApplicationRecord
  STATUS = ["Accepted", "pending", "Rejected"]
  belongs_to :user
  belongs_to :coach_session

  validates :total_amount, :date_start, :date_end, presence: true
  has_one_attached :avatar
  validates :status, inclusion: { in: STATUS }
end
