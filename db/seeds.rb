# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying rooms"
Room.destroy_all

puts "creating rooms"
Room.create!(
  title: "Room 1",
  description: "nice flat in Paris",
  city: "Paris",
  neighborhood: "Montmartre",
  room_number: 2,
  bathroom_number: 1,
  bed_number: 2,
  price: 200,
  available_start_date: Date.today,
  available_end_date: Date.today + 1.month,
)

Room.create!(
  title: "Room 2",
  description: "Flat next to the Acropole",
  city: "Athens",
  neighborhood: "Acropole",
  room_number: 2,
  bathroom_number: 2,
  bed_number: 4,
  price: 300,
  available_start_date: Date.today,
  available_end_date: Date.today + 1.month,
)
puts "finished"
