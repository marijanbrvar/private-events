# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Event.destroy_all
Attendance.destroy_all

user = User.create!(name: 'zil')
p user.name
Event.create!(name: Faker::Artist.name, creator: user, location: Faker::Address.full_address, 
  date: Faker::Date.forward(days: 123), 
  description: Faker::Lorem.paragraph(sentence_count: 4))

10.times do |i|
  user = User.create!(name: "#{Faker::Artist.name}_#{i}")
  p user.name
  Event.create!(name: Faker::Artist.name, creator: user, location: Faker::Address.full_address, 
    date: Faker::Date.forward(days: 123), 
    description: Faker::Lorem.paragraph(sentence_count: 4))
end

