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
#Favorites.destroy_all
#Reviews.destroy_all

puts "Creating users..."

testUser = User.new(id: 2, email: "test@test.com" , password: 123456)
testUser.save!

puts "Creating places.."

pastelrita = Place.new(
  id: 510,
  name: "Pastel Rita",
  description: "Welcome to Pastel Rita, your friendly haven for coworking. In our cafe with soothing tones,
  the intersection of work and relaxation becomes a unique experience. The intoxicating aroma of freshly ground coffee
  accompanies each creative encounter. With bright spaces, fast Wi-Fi, and artisanal delights, every visit transforms
  into a productive and enjoyable moment. Pastel Rita is not just a cafe but a place where creative minds meet, ideas
  flourish, and collaboration becomes natural. Join us for a coffee break or an inspiring workday in a welcoming
  atmosphere.",
  location: "5761 Boul. Saint-Laurent",
  rating: 3,
  contact_details: "554-664-7774"
)
file = URI.open("https://images.squarespace-cdn.com/content/v1/59ebb403dc2b4af6dba8cb67/1548988299768-2IO5KY0JKWFD1CNVJZ7K/untitled+shoot-0078.jpg?format=1500w")
pastelrita.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
pastelrita.save!

berniebeigne = Place.new(
  id: 556,
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
  id: 521,
  name: "Butterblume",
  description: "Welcome to Butterblum, the epicenter of indulgence and creativity. Our coworking cafe is where
  exceptional vegan flavors meet inspiration. Picture exquisitely delicious pastries, stimulating workspaces,
  and an ambiance where each bite transports you to a sweet paradise. Quickly connect with our Wi-Fi, plug into your
  workstation, and let yourself be carried away by the magic of Butterblum, where every moment is a celebration of the
  perfect fusion between a passion for work and gastronomic delight. Come, indulge, create, and experience
  the unique essence of Butterblum.",
  location: "5836 Boul. Saint-Laurent",
  rating: 5,
  contact_details: "554-664-7774"
)
file = URI.open("https://tastet.ca/wp-content/uploads/merchants/cover/le-butterblume-24.jpg")
butterblume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
butterblume.save!

ingamba = Place.new(
  id: 34,
  name: "Café In Gamba",
  description: "Welcome to In Gamba, more than just a café, it's a sensory experience that will awaken your senses.
  Immerse yourself in the intoxicating aroma of our freshly roasted coffee and dive into a warm setting. Nestled in the
  hustle and bustle of urban life, our café offers a refuge of tranquility, where each cup tells a story of quality and
  passion. Indulge in our delicious culinary creations, carefully crafted to complement every sip. In Gamba is where
  connoisseurs meet, where coffee becomes a celebration, and where every moment is a delightfully unforgettable pause.
  Come, discover, and savor the experience at In Gamba.",
  location: "71 R. St Viateur Est",
  rating: 3,
  contact_details: "554-664-7774"
)
file = URI.open("https://cdn.th3rdwave.coffee/processed/merchants/Tfn6oakZv.jpg/768x768i_2x.jpg")
ingamba.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
ingamba.save!

puts "Creating Test Favorites"

#testFav = Favorite.new(id: 1, place_id: 556, user_id: 2)
#testFave.save!

puts "Done !"
