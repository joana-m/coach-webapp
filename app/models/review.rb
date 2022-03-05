class Review < ApplicationRecord
  belongs_to :coach_session
  validates :content, length: { minimum: 10 }
end
