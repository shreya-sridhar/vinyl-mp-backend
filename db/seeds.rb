# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

OrderRecord.destroy_all
Order.destroy_all
SellRecord.destroy_all
Record.destroy_all
User.destroy_all

top_artists = [
  "Bob Dylan",
  "Marvin Gaye",
  "The Rolling Stones",
  "Nirvana",
  "Michael Jackson",
  "John Lennon / Plastic Ono Band",
  "Stevie Wonder",
  "U2",
# "The Who",
# "Led Zeppelin",
# "Sex Pistols",
# "The Doors",
# "Pink Floyd",
# "Bob Marley & The Wailers",
# "Guns N' Roses",
# "Radiohead",
# "Billy Joel",
# "AC/DC",
# "John Lennon",
# "Johnny Cash",
# "Elton John",
# "Prince",
# "Frank Sinatra",
# "Kanye West",
# "Iggy and The Stooges",
# "KISS",
# "Metallica",
# "Aerosmith",
# "ABBA",
# "Madonna",
# "Green Day",
# "Nine Inch Nails",
# "The Smiths",
# "Queen",
# "Eminem",
# "Jay Z",
# "Whitney Houston",
# "X",
# "Red Hot Chili Peppers",
# "The Police",
# "Moby",
# "Depeche Mode",
# "Oasis",
# "ZZ Top",
# "The Temptations",
# "Lynyrd Skynyrd",
# "Dr. John",
# "The Ronettes",
# "Amy Winehouse",
# "Adele",
# "Coldplay"
]

#returns all artist names in API w/ Artist descriptions
# @artist_array = []
api_key = 523532
# api_key = ENV["AUDIODB_KEY"]

# seeds all records associated with an artist
top_artists.each do |artist|
  begin
    record_db = RestClient.get "theaudiodb.com/api/v1/json/#{api_key}/searchalbum.php?s=#{artist}"
    record_array = JSON.parse(record_db)["album"]
    record_array.each do |record|
      record_name = record["strAlbum"]
      record_year = record["intYearReleased"]
      null_cover = 'https://images.unsplash.com/photo-1458560871784-56d23406c091?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200'
      record_picture = record["strAlbumThumb"] == nil || record["strAlbumThumb"] == "" ? null_cover : record["strAlbumThumb"]
      record_genre = record["strGenre"] == nil || record["strGenre"] == "" ? "hmmm" : record["strGenre"]
      record_rating = record["intScore"]
      record_description = record["strDescriptionEN"] == nil || record["strDescriptionEN"] == "" ? "That's an awesome Record" : record["strDescriptionEN"]

      id = record["idAlbum"]
      song_db = RestClient.get "theaudiodb.com/api/v1/json/#{api_key}/track.php?m=#{id}"
      song_array = JSON.parse(song_db)["track"]
      songs_list = []
      song_array.each do |song|
        song_name = song["strTrack"]
        songs_list << song_name
      end

      Record.create(name: record_name,
                    artist: artist,
                    cover: record_picture,
                    songs_list: songs_list,
                    year: record_year,
                    genre: record_genre,
                    price: Random.new.rand(5.00..500.00),
                    rating: record_rating.to_i / 2,
                    description: record_description
      )
    end
  rescue NoMethodError, RuntimeError
    next(artist)
  end
end

10.times do
  User.create(
    username: Faker::Internet.unique.user_name,
    password: '12345',
    bio: Faker::Hacker.say_something_smart,
  )
end

User.all.each do |user|
  friends1 = []
  favs1 = []
  friendlist = User.all.sample(Random.new.rand(0..10))
  favlist = Record.all.sample(Random.new.rand(0..20))
  friendlist.each do |fri|
    friends1 << fri.id
  end
  favlist.each do |f|
    favs1 << [f.name, f.cover]
  end
  user.friends = friends1
  user.favorites = favs1
  user.save
end

60.times do
  SellRecord.create(
    user_id: User.all.sample.id,
    record_id: Record.all.sample.id,
    sell_price: Random.new.rand(10.00..200.00)
  )
end

Order.create(user_id: 1, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 2, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 3, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 4, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 5, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 6, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 7, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 8, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 9, status: "in_cart", total_sum: 0.00)
Order.create(user_id: 10, status: "in_cart", total_sum: 0.00)


30.times do
  Order.create(user_id: User.all.sample.id, status: "completed", total_sum: 0.00)
end

80.times do
  OrderRecord.create(
    order_id: Order.all.sample.id,
    record_id: Record.all.sample.id,
    order_date: Faker::Date.between(from: '2018-0101', to: '2021-02-18')
  )
end

puts 'done'






