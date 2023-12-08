# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Place.destroy_all
User.destroy_all

puts "Creating users..."

testUser = User.new(id: 2, email: "test@test.com" , password: 123456)
testUser.save!

puts "Creating places.."

cafeloca = Place.new(id: 33, name: "Cafe Loca", description: "A crazy cool cafe", location: "36 Farrow St", rating: 4, contact_details: "555-666-7777")
cafeloca.save!

caferock = Place.new(id: 556, name: "Cafe Rock", description: "A rocking cafe", location: "49 Saint Bernard St", rating: 3, contact_details: "554-664-7774")
caferock.save!

puts "Creating Test Favorites"

testFav = Favorite.new(id: 1, place_id: 556, user_id: 2)
testFave.save!

puts "Done !"
