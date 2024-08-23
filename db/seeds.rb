# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Creating 3 users
User.destroy_all

name_of_each_deal = {
  music: ["Spotify Premium", "Apple Music", "Yandex Music"],
  video: ["Netflix", "YouTube Premium", "Amazon"],
  tv: ["Hulu", "Disney+", "Sky"],
  sports: ["ESPN+", "NBA League Pass", "Eurosport"],
  gaming: ["Xbox Game Pass", "PlayStation Plus", "Steam"],
  podcast: ["Stitcher Premium", "Luminary"],
  audiobook: ["Audible", "Scribd", "Litres"]
}

users = 3.times.map do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    username: "user#{i+1}",
    password: "password#{i+1}"
  )
end
img_src = ""

# Creating 100 deals
100.times do |i|
  category = ["music", "video", "TV", "sports", "gaming", "podcast", "audiobook"].sample
  case category
    when "music"
      img_src = "https://static.vecteezy.com/system/resources/previews/000/559/411/large_2x/vector-a-musical-symbol.jpg"
    when "video"
      img_src = "https://static.vecteezy.com/system/resources/previews/000/644/657/original/vector-video-icon-symbol-sign.jpg"
    when "TV"
      img_src = "https://static.vecteezy.com/system/resources/previews/010/157/977/non_2x/tv-icon-sign-symbol-design-free-png.png"
    when "sports"
      img_src = "https://static.vecteezy.com/system/resources/previews/000/348/985/original/vector-indoor-sport-game-athletic-set-icon-symbol-sign-pictogram.jpg"
    when "gaming"
      img_src = "https://static.vecteezy.com/system/resources/previews/000/366/871/original/video-game-vector-icon.jpg"
    when "podcast"
      img_src = "https://static.vecteezy.com/system/resources/previews/002/157/611/original/illustrations-concept-design-podcast-channel-free-vector.jpg"
    when "audiobook"
      img_src = "https://cdn-icons-png.flaticon.com/512/865/865552.png"
  end
  updated_name = ""
  name_of_each_deal.each do |key, value|
    if key.to_s == category.downcase
      updated_name = value.sample
    end
  end
  Deal.create!(
    name: updated_name,
    price: rand(20..100), # Random price between 1 and 100
    description: "Description for #{updated_name} #{i+1}",
    category: category, # Random category
    duration: ["1-month", "3-months", "6-months", "12-months"].sample, # Random duration
    number_of_users: rand(2..5).to_s, # Random number of users between 1 and 5
    user_id: users.sample.id, # Assign to a random user
    image_path: img_src
  )
end

puts "Seeding completed!"
