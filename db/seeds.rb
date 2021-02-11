# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Record.destroy_all

10.times do
  User.create(
    username: Faker::Name.name,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    bio: Faker::Lorem.sentence
  )
end

20.times do
  Record.create(
    name: Faker::Music.album,
    artist: Faker::Music.band,
    cover: "https://images-na.ssl-images-amazon.com/images/I/717VbeZb0bL._AC_SL1500_.jpg",
    songs_list: Faker::Lorem.words(number: 4),
    year: Random.new.rand(1900..2020),
    price: Random.new.rand(10.00..1000.00)
  )
end

puts 'done'