# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CoachSession.destroy_all
User.destroy_all

p "Destroying data..."

client = User.create!(email: "john@gmail.com", password: "123456")
coach = User.create!(email: "mel@gmail.com", password: "123456")

session = CoachSession.create!(session_name: "Best personal trainer in town!", type_of_activity: "Weight-Lifting", description: "2020 the world crossfit champion", price_per_day: 40, user: coach)

p session

booking = Booking.create!(user: client, coach_session: session, total_amount: 200, date_start: "2020/09/09", date_end: "2020/09/10")

p booking
