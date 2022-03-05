class Review < ApplicationRecord
  belongs_to :coach_session
  validates :content, presence: true
end
