# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'
require 'json'

puts 'Cleaning up database...'
Booking.destroy_all
Flat.destroy_all
User.destroy_all
puts 'Database cleaned'


3.times do |i|
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user_#{i + 1}@gmail.com",
    password: "123456"
  ).save!
end


flat_1 = Flat.new(
  name: "Light & Spacious Garden Flat London",
  location: "10 Clifton Gardens London W9 1DT",
  description: "A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory",
  price_per_night: 75,
  capacity: 3,
  user: User.first
) 

pic_1 = URI.open("https://images.unsplash.com/photo-1494526585095-c41746248156?w=1200")
pic_12 = URI.open("https://images.unsplash.com/photo-1558981082-c7d43331cd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80")
flat_1.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")
flat_1.photos.attach(io: pic_12, filename: "2.jpg", content_type: "image/jpg")
flat_1.save!

flat_2 = Flat.new(
  name: "Stylish House Close to River Thames",
  location: "5 Queensmill Road London SW6 6JP",
  description: "Lovely warm comfortable and stylishly furnished house. Private bedroom and bathroom with shared living areas.",
  price_per_night: 65,
  capacity: 2,
  user: User.second
)

pic_2 = URI.open("https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=1200")
pic_23 = URI.open("https://images.unsplash.com/photo-1583910973632-8cc733c2c02f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=743&q=80")
pic_24 = URI.open("https://images.unsplash.com/photo-1521202062901-93e66500cc5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=721&q=80")
flat_2.photos.attach(io: pic_2, filename: "2.jpg", content_type: "image/jpg")
flat_2.photos.attach(io: pic_23, filename: "3.jpg", content_type: "image/jpg")
flat_2.photos.attach(io: pic_24, filename: "4.jpg", content_type: "image/jpg")
flat_2.save!

flat_3 = Flat.new(
  name: "St Pancras Clock Tower Guest Suite",
  location: "Euston Rd London N1C 4QP",
  description: "A mini apartment within the clock tower apartment at St Pancras Station, with its own en suite bathroom and kitchen and sitting area.",
  price_per_night: 121,
  capacity: 10,
  user: User.last
)

pic_3 = URI.open("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200")
flat_3.photos.attach(io: pic_3, filename: "3.jpg", content_type: "image/jpg")
flat_3.save!

flat_4 = Flat.new(
  name: "Light & Spacious Garden Flat Jakarta",
  location: "10 Clifton Gardens London W9 1DT",
  description: "A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory",
  price_per_night: 50,
  capacity: 8,
  user: User.third
)

pic_4 = URI.open("https://images.unsplash.com/photo-1583729897447-a4c7e6cfad81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80?w=1200")
flat_4.photos.attach(io: pic_4, filename: "4.jpg", content_type: "image/jpg")
flat_4.save!

flat_5 = Flat.new(
  name: "Stylish House Close to River Bali",
  location: "5 Queensmill Road London SW6 6JP",
  description: "Lovely warm comfortable and stylishly furnished house. Private bedroom and bathroom with shared living areas.",
  price_per_night: 150,
  capacity: 20,
  user: User.last
)

pic_5 = URI.open("https://images.unsplash.com/photo-1581974206939-b42731ea9dc9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80?w=1200")
flat_5.photos.attach(io: pic_5, filename: "5.jpg", content_type: "image/jpg")
flat_5.save!

flat_6 = Flat.new(
  name: "Canggu Clock Tower Guest Suite",
  location: "Euston Rd London N1C 4QP",
  description: "A mini apartment within the clock tower apartment at St Pancras Station, with its own en suite bathroom and kitchen and sitting area.",
  price_per_night: 250,
  capacity: 10,
  user: User.first
)

pic_6 = URI.open("https://images.unsplash.com/photo-1581974206967-93856b25aa13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=854&q=80?w=1200")
flat_6.photos.attach(io: pic_6, filename: "6.jpg", content_type: "image/jpg")
flat_6.save!


booking1 = Booking.new(
	user_id: User.first.id,
	flat_id: Flat.first.id,
	status: "pending",
	start_date: Date.today + 1.month,
	end_date: Date.today + 1.month + 10.days
)
booking1.save!

booking2 = Booking.new(
	user_id: User.second.id,
	flat_id: Flat.second.id,
	status: "pending",
	start_date: Date.today + 2.month,
	end_date: Date.today + 2.month + 10.days
)
booking2.save!

booking3 = Booking.new(
	user_id: User.second.id,
	flat_id: Flat.second.id,
	status: "done",
	start_date: Date.today + 3.month,
	end_date: Date.today + 3.month + 10.days
)
booking3.save!

booking4 = Booking.new(
	user_id: User.last.id,
	flat_id: Flat.last.id,
	status: "pending",
	start_date: Date.today + 4.month,
	end_date: Date.today + 4.month + 10.days
)
booking4.save!

booking5 = Booking.new(
	user_id: User.last.id,
	flat_id: Flat.last.id,
	status: "rejected",
	start_date: Date.today + 4.month,
	end_date: Date.today + 4.month + 10.days
)
booking5.save!

booking6 = Booking.new(
	user_id: User.second.id,
	flat_id: Flat.first.id,
	status: "confirmed",
	start_date: Date.today + 4.month,
	end_date: Date.today + 4.month + 10.days
)
booking6.save!
