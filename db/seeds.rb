# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "open-uri"
# file = URI.open("https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
# file is after ...attach(io:file .. on line20)
# Booking.destroy_all
# CoachSession.destroy_all
# User.destroy_all

# p "Destroying data..."

# client = User.first
# # seed 1
# %w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
#   file = File.open(Rails.root.join("app/assets/images/#{type}_1.jpeg"))
#   session = CoachSession.new(session_name: "Best #{type} trainer in town!", type_of_activity: CoachSession::ACTIVITIES[idx], description: "2020 the world #{type} champion", price_per_day: 40, user: coach, address: "Ubud")
#   4.times do |i|
#     subfile_one = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 2}.jpeg"))
#     session.additional_photos.attach(io: subfile_one, filename: "trainer.jpeg")
#   end

#   session.save!
#   p session
# end

# # seed 2
# %w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
#   file_two = File.open(Rails.root.join("app/assets/images/#{type}_2.jpeg"))
#   session = CoachSession.new(session_name: "Your #{type} coach in town!", type_of_activity: CoachSession::ACTIVITIES[idx], description: "10 years experience as a coach", price_per_day: 50, user: coach, address: "Badung")
#   session.main_photo.attach(io: file_two, filename: "coach.jpeg")
#   4.times do |i|
#     subfile_two = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 3}.jpeg"))
#     session.additional_photos.attach(io: subfile_two, filename: "coach.jpeg")
#   end
#   session.save!
#   p session
# end

# # # # seed 3
# %w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
#   file_three = File.open(Rails.root.join("app/assets/images/#{type}_3.jpeg"))
#   session = CoachSession.new(session_name: "Train with me", type_of_activity: CoachSession::ACTIVITIES[idx], description: "#{type} is fun with me!", price_per_day: 45, user: coach, address: "Ubud")
#   session.main_photo.attach(io: file_three, filename: "coachtwo.jpeg")
#   4.times do |i|
#     subfile_three = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 3}.jpeg"))
#     session.additional_photos.attach(io: subfile_three, filename: "coachtwo.jpeg")
#   end
#   session.save!
#   p session
# end

# # # # seed 4
# %w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
#   file_four = File.open(Rails.root.join("app/assets/images/#{type}_4.jpeg"))
#   session = CoachSession.new(session_name: "Train with me", type_of_activity: CoachSession::ACTIVITIES[idx], description: "Doing #{type} is easy with me", price_per_day: 45, user: coach, address: "Canggu")
#   session.main_photo.attach(io: file_four, filename: "coachthree.jpeg")
#   4.times do |i|
#     subfile_four = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 2}.jpeg"))
#     session.additional_photos.attach(io: subfile_four, filename: "coachthree.jpeg")
#   end
#   session.save!
#   p session
# end

# # # seed 5
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file_five = File.open(Rails.root.join("app/assets/images/#{type}_5.jpeg"))
  session = CoachSession.new(session_name: "Join me for #{type} training", type_of_activity: CoachSession::ACTIVITIES[idx], description: "#{type} is my passion! ", price_per_day: 35, user: coach, address: "Canggu")
  session.main_photo.attach(io: file_five, filename: "coachfour.jpeg")
  4.times do |i|
    subfile_five = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 2}.jpeg"))
    session.additional_photos.attach(io: subfile_five, filename: "coachfour.jpeg")
  end
  session.save!
  p session
end

booking = Booking.create!(user: client, coach_session: CoachSession.first, total_amount: 200, date_start: "2020/09/09", date_end: "2020/09/10")

p booking
