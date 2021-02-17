# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderRecord.destroy_all
Order.destroy_all
SellRecord.destroy_all
Record.destroy_all
User.destroy_all


10.times do
  User.create(
    username: Faker::Name.name,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    bio: Faker::Lorem.sentence,
  )
end


70.times do
  Record.create(
    name: Faker::Music.album,
    artist: Faker::Music.band,
    cover: "https://images.unsplash.com/photo-1526382551041-3c817fc3d478?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=300&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=400",
    songs_list: Faker::Lorem.words(number: 4),
    year: Random.new.rand(1900..2020),
    price: Random.new.rand(10.00..1000.00),
    rating: Random.new.rand(0..5)
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
    favs1 << f.id
  end

  user.friends = friends1
  user.favorites = favs1
  user.save
end


100.times do
  SellRecord.create(
    user_id: User.all.sample.id,
    record_id: Record.all.sample.id,
    sell_price: Random.new.rand(10.00..200.00)
  )
end

30.times do
  Order.create(
    user_id: User.all.sample.id,
    status: %w[in_cart completed].sample,
    total_sum: 0.00
  )
end

100.times do
  OrderRecord.create(
    order_id: Order.all.sample.id,
    record_id: Record.all.sample.id
    )
end

puts 'done'






