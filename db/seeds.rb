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
Booking.destroy_all
CoachSession.destroy_all
User.destroy_all

p "Destroying data..."

client = User.create!(email: "john@gmail.com", password: "123456")
coach = User.create!(email: "mel@gmail.com", password: "123456")
%w[surfer weightlifter calis yoga swimmer dancer].each_with_index do |type, idx|
  file = File.open(Rails.root.join("app/assets/images/#{type}_1.jpeg"))
  session = CoachSession.new(session_name: "Best personal #{type} trainer in town!", type_of_activity: CoachSession::ACTIVITIES[idx], description: "2020 the world crossfit champion", price_per_day: 40, user: coach)
  session.main_photo.attach(io: file, filename: "trainer.jpeg")
  5.times do |i|
    file_two = File.open(Rails.root.join("app/assets/images/#{type}_#{i + 2}.jpeg"))
    session.additional_photos.attach(io: file_two, filename: "trainer.jpeg")
  end
  session.save!
  p session
end

booking = Booking.create!(user: client, coach_session: CoachSession.first, total_amount: 200, date_start: "2020/09/09", date_end: "2020/09/10")

p booking
