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

client = User.first ? User.first : User.create!(email: "john@gmail.com", password: "123456")
coach = User.last ? User.last : User.create!(email: "mel@gmail.com", password: "123456")
# # seed 1
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file = File.open(Rails.root.join("app/assets/images/#{type}_1.jpeg"))
  session = CoachSession.new(session_name: "Best #{type} trainer in town!", type_of_activity: CoachSession::ACTIVITIES[idx],
    description: "Training #{type} with me is gives you a chance to explore and build a strong skill in your sport life. I have 10 years experience as a coach. I guarantee you, you will achieve your goals by training with me!",
    price_per_day: 40, user: coach, address: "Ubud")
  session.main_photo.attach(io: file, filename: "coach.jpeg")
  session.save!
  p session
end

# # seed 2
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file_two = File.open(Rails.root.join("app/assets/images/#{type}_2.jpeg"))
  session = CoachSession.new(session_name: "#{type} is so fun!",
    type_of_activity: CoachSession::ACTIVITIES[idx],
    description: "Everyone has a different fitness goal. I am are here to help you meet and break them. But it is not just about getting you fit. I will help you unlock your full fitness potential. You will find yourself moving, and even standing better.",
    price_per_day: 50, user: coach, address: "Java")
  session.main_photo.attach(io: file_two, filename: "coach.jpeg")
  session.save!
  p session
end

# # # # seed 3
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file_three = File.open(Rails.root.join("app/assets/images/#{type}_3.jpeg"))
  session = CoachSession.new(session_name: "Train with me", type_of_activity: CoachSession::ACTIVITIES[idx],
    description: "I provide beginner and all level (beginner-intermediate) #{type} classes every day. Since 2010, I have been working as a #{type} coach. Becoming fully skilled at this sport is just steps away..",
    price_per_day: 45, user: coach, address: "Denpasar")
  session.main_photo.attach(io: file_three, filename: "coachtwo.jpeg")
  session.save!
  p session
end

# # # # seed 4
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file_four = File.open(Rails.root.join("app/assets/images/#{type}_4.jpeg"))
  session = CoachSession.new(session_name: "Doing #{type} is easy with me", type_of_activity: CoachSession::ACTIVITIES[idx],
    description: " Doing sports is not only for being fit. It is also for fun! Enjoy a world-class beach lifestyle #{type} class with me who is certified personal coach.",
    price_per_day: 45, user: coach, address: "Canggu")
  session.main_photo.attach(io: file_four, filename: "coachthree.jpeg")
  session.save!
  p session
end

# # # seed 5
%w[surfing weightlifting calisthenics yoga swimming dancing].each_with_index do |type, idx|
  file_five = File.open(Rails.root.join("app/assets/images/#{type}_5.jpeg"))
  session = CoachSession.new(session_name: "Join me for #{type} class", type_of_activity: CoachSession::ACTIVITIES[idx],
    description: "I endeavour to take you on a journey from one success to a higher level of success – from Strength to Strength. Our team is established in January 2013. We have a mission to introduce an effective training program in a judgment free, fun, and welcoming environment. A place where you can feel like you belong no matter what is your sport background is. We want to hear your story, get to know you, help you reach your goals.",
    price_per_day: 35, user: coach, address: "Canggu")
  session.main_photo.attach(io: file_five, filename: "coachfour.jpeg")
  session.save!
  p session
end

booking = Booking.create!(user: client, coach_session: CoachSession.first, total_amount: 200, date_start: "2020/09/09", date_end: "2020/09/10")

p booking
