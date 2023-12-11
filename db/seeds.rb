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
Booking.destroy_all
Favorite.destroy_all
Review.destroy_all

puts "Creating users..."

testUser = User.new( email: "test@test.com" , password: 123456)
testUser.save!

puts "Creating places.."

pastelrita = Place.new(
  id: 510,
  name: "Pastel Rita",
  description: "Bienvenue chez Pastel Rita, votre havre convivial de coworking. Dans notre café aux teintes apaisantes,
  la rencontre entre travail et détente devient une expérience unique. Le parfum enivrant du café fraîchement moulu
  accompagne chaque rencontre créative. Avec des espaces lumineux, une connexion Wi-Fi rapide et des délices artisanaux,
  chaque visite se transforme en un moment productif et agréable. Pastel Rita n'est pas simplement un café,
  mais un lieu où les esprits créatifs se rencontrent, où les idées s'épanouissent et où la collaboration devient naturelle.
  Rejoignez-nous pour une pause café ou une journée de travail inspirante dans une atmosphère accueillante.",
  location: "5761 Boul. Saint-Laurent",
  rating: 3,
  contact_details: "554-664-7774"
)
pastelrita.save!

berniebeigne = Place.new(
  id: 556,
  name: "Bernie Beigne",
  description: "Bienvenue chez Bernie Beigne, l'oasis gourmande où les saveurs exquises rencontrent la productivité
  décontractée. Plongez dans l'atmosphère rétro, savourez nos beignes artisanaux et laissez-vous inspirer.
  Avec une connexion Wi-Fi rapide et des prises électriques,
  Bernie Beigne transforme chaque instant en une pause délicieusement productive.
  ",
  location: "23 Rue Bernard Ouest",
  rating: 4,
  contact_details: "554-664-7774"
)
berniebeigne.save!

butterblume = Place.new(
  id: 521,
  name: "Butterblume",
  description: "
  Bienvenue à Butterblum, l'épicentre de la gourmandise et de la créativité. Notre café coworking est le lieu où les
  saveurs vegan exceptionnelles rencontrent l'inspiration. Imaginez des pâtisseries divinement délicieuses, des espaces
  de travail stimulants et une ambiance où chaque bouchée vous transporte dans un paradis sucré. Connectez-vous
  rapidement avec notre Wi-Fi, branchez-vous à votre poste de travail et laissez-vous emporter par la magie de
  Butterblum, où chaque instant est une célébration de la fusion parfaite entre la passion pour le travail et
  la délectation gastronomique. Venez, régalez-vous, créez, et vivez l'expérience unique de Butterblum.",
  location: "5836 Boul. Saint-Laurent",
  rating: 5,
  contact_details: "554-664-7774"
)
butterblume.save!

ingamba = Place.new(
  id: 34,
  name: "Café In Gamba",
  description: "
  Bienvenue à In Gamba, bien plus qu'un café, c'est une expérience sensorielle qui éveillera vos sens. Imprégnez-vous
  de l'arôme enivrant de notre café fraîchement torréfié et plongez dans un décor chaleureux. Notre café, niché dans
  l'effervescence de la vie urbaine, vous offre un refuge de tranquillité, où chaque tasse raconte une histoire de
  qualité et de passion. Laissez-vous tenter par nos délicieuses créations culinaires, conçues avec soin pour
  accompagner chaque gorgée. In Gamba, c'est le lieu où les connaisseurs se rencontrent, où le café devient une
  célébration, et où chaque moment est une pause délicieusement inoubliable. Venez, découvrez, savourez chez In Gamba.",
  location: "71 R. St Viateur Est",
  rating: 3,
  contact_details: "554-664-7774"
)
ingamba.save!

puts "Creating Test Favorites"

testFav = Favorite.new(place_id: 556, user_id: testUser.id)
testFav.save!

puts "Creating Test Review"

testRev = Review.new(place_id: 556, user_id: testUser.id , content: "Did NOT like this place", rating: 2)
testRev.save!

puts "Creating Test Booking"

testBook = Booking.new(place_id: 556, user_id: testUser.id , time: "Sun, 02 Jan 2024 20:24:00.000000000 UTC +00:00")
testBook.save!

puts "Done !"
