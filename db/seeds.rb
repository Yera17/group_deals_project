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

# Creating 100 deals
100.times do |i|
  category = ["music", "video", "TV", "sports", "gaming", "podcast", "audiobook"].sample
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
  )
end

puts "Seeding completed!"
