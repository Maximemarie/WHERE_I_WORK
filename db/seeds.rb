# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Cleaning database..."
Place.destroy_all
User.destroy_all
Booking.destroy_all
Favorite.destroy_all
Review.destroy_all
Filter.destroy_all

puts "Creating users..."

testUser = User.new( email: "test@test.com" , password: 123456, username: "TestyBestie")
testUser.save!

testKaren = User.new( email: "karen@test.com" , password: 123456, username: "DontcallmeKaren")
testKaren.save!

testBrian = User.new( email: "brian@test.com" , password: 123456, username: "BrianLovesCoffee")
testBrian.save!

testWagon = User.new( email: "wagon@test.com" , password: 123456, username: "CoffeeCoder")
testWagon.save!

puts "Creating places.."

pastelrita = Place.new(
  name: "Pastel Rita",
  description: "Pastel Rita: Your coworking haven. Relax and work in our soothing cafe with fast Wi-Fi, artisanal
  treats, and a creative atmosphere. Join us for a productive and enjoyable
  workday or a quick coffee break.",
  location: "5761 Boul. Saint-Laurent",
  rating: 3,
  contact_details: "554-664-7774"
)
file = URI.open("https://images.squarespace-cdn.com/content/v1/59ebb403dc2b4af6dba8cb67/1548988299768-2IO5KY0JKWFD1CNVJZ7K/untitled+shoot-0078.jpg?format=1500w")
pastelrita.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

menuboard = File.open(Rails.root.join("app", "assets", "images", "menuboard.png"))
pastelrita.menuboard.attach(io: menuboard, filename: 'nes.png', content_type: 'image/png')
pastelrita.save!

berniebeigne = Place.new(
  name: "Bernie Beigne",
  description: "Welcome to Bernie Beigne, the gourmet oasis where exquisite flavors meet relaxed productivity.
  Immerse yourself in the retro atmosphere, savor our artisanal donuts, and let yourself be inspired. With fast Wi-Fi
  and electrical outlets, Bernie Beigne transforms every moment into a delightfully productive break..",
  location: "23 Rue Bernard Ouest",
  rating: 4,
  contact_details: "554-664-7774"
)
file = URI.open("https://tastet.ca/wp-content/uploads/2018/04/tommy-cafe-montreal-2.jpg")
berniebeigne.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
berniebeigne.save!

butterblume = Place.new(
  name: "Butterblume",
  description: "Indulge at Butterblum, where vegan delights and creativity converge. Savor exquisite pastries, find
  inspiration in stimulating workspaces, and immerse yourself in an ambiance that transports you to a sweet paradise.
  With fast Wi-Fi, plug in, and let Butterblum's magic celebrate the fusion of work and gastronomic passion.
  Experience the unique essence with us in Montréal.",
  location: "5836 Boul. Saint-Laurent",
  rating: 5,
  contact_details: "554-664-7774"
)
file = URI.open("https://tastet.ca/wp-content/uploads/merchants/cover/le-butterblume-24.jpg")
butterblume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
butterblume.save!

ingamba = Place.new(
  name: "Café In Gamba",
  description: "Welcome to In Gamba, a sensory café experience. Amid urban life, enjoy the aroma of freshly roasted
  coffee and a warm setting. Each cup tells a tale of quality and passion. Indulge in crafted culinary delights,
  turning every moment into a delightful pause. Discover and savor the In Gamba experience.",
  location: "71 R. St Viateur Est",
  rating: 3,
  contact_details: "554-664-7774"
)
file = URI.open("https://cdn.th3rdwave.coffee/processed/merchants/Tfn6oakZv.jpg/768x768i_2x.jpg")
ingamba.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
ingamba.save!

puts "Creating Filters..."

ingambaFilter = Filter.new(
  place_id: ingamba.id, vegan: true, gluten_free: false, ambiance: "Chill", outlets: true, wifi: false
)
ingambaFilter.save!

pastelritaFilter = Filter.new(
  place_id: pastelrita.id, vegan: true, gluten_free: true, ambiance: "Quiet", outlets: false, wifi: true
)
pastelritaFilter.save!

butterblumeFilter = Filter.new(
  place_id: butterblume.id, vegan: false, gluten_free: false, ambiance: "Lively", outlets: false, wifi: true
)
butterblumeFilter.save!

berniebeigneFilter = Filter.new(
  place_id: berniebeigne.id, vegan: false, gluten_free: true, ambiance: "Chill", outlets: true, wifi: true
)
berniebeigneFilter.save!

puts "Creating Test Favorites..."

testFav = Favorite.new(place_id: ingamba.id, user_id: testUser.id)
testFav.save!

secFav = Favorite.new(place_id: butterblume.id, user_id: testUser.id)
secFav.save!

puts "Creating Test Review..."

testRev = Review.new(place_id: ingamba.id, user_id: testUser.id , content: "Did NOT like this place", rating: 1)
testRev.save!

testRev1 = Review.new(place_id: ingamba.id, user_id: testUser.id , content: "Love Love Looooooved it", rating: 5)
testRev1.save!

testRev2 = Review.new(place_id: berniebeigne.id, user_id: testBrian.id , content: "Pretty good", rating: 4)
testRev2.save!

testRev3 = Review.new(place_id: berniebeigne.id, user_id: testKaren.id , content: "When i asked for a refund for the sandwich they told me that i had already eaten it. I will never ever eat here again", rating: 1)
testRev3.save!

testRev4 = Review.new(place_id: pastelrita.id, user_id: testBrian.id , content: "It was SO delicious", rating: 5)
testRev4.save!

testRev5 = Review.new(place_id: pastelrita.id, user_id: testWagon.id , content: "I got so much work done and the coffee was fantastic", rating: 4)
testRev5.save!

testRev6 = Review.new(place_id: butterblume.id, user_id: testWagon.id , content: "Ill DEFINITELY be coming back", rating: 5)
testRev6.save!

testRev6 = Review.new(place_id: butterblume.id, user_id: testUser.id , content: "It was way too loud when I was there", rating: 2)
testRev6.save!

puts "Creating Test Booking..."

testBook = Booking.new(place_id: ingamba.id, user_id: testUser.id , time: "Tue, 02 Jan 2024 20:24:00.000000000 UTC +00:00")
testBook.save!

puts "Done !"
