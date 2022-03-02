class CoachSession < ApplicationRecord
  ACTIVITIES = ['Surfing', 'Weight-Lifting', 'Calisthenics', "Yoga", "Swimming", "Dancing"]
  belongs_to :user
  validates :session_name, :type_of_activity, :price_per_day, presence: true
  validates :price_per_day, numericality: true
  validates :type_of_activity, inclusion: {in: ACTIVITIES}

  has_one_attached :main_photo
  has_many_attached :additional_photos
  validates :main_photo, :additional_photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

# CoachSession.create(session_name:"Bench Press Training", type_of_activity:"Weight-Lifting", price_per_day: 30, user_id: 4)
