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
    password: "123456789"
  )
end
img_src = ""

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
    image_path: img_src
  )
end

# code aug 23 2024 vidya

  deal_image_urls = {
    "Spotify Premium" => "https://static.independent.co.uk/2022/05/19/10/spotify%20cncel.jpg",
    "Apple Music" => "https://www.apple.com/newsroom/images/product/apple-music/apple_music-update_hero_08242021_inline.jpg.slideshow-xlarge_2x.jpg",
    "Yandex Music" => "https://cdn6.aptoide.com/imgs/2/8/f/28f8065e9c14ba9b55b15a850f3fbfd1_fgraphic.jpg",
    "Netflix" => "https://i.pcmag.com/imagery/reviews/05cItXL96l4LE9n02WfDR0h-5.fit_scale.size_1028x578.v1582751026.png",
    "YouTube Premium" => "https://www.tubekarma.com/wp-content/uploads/2021/07/3_11.png",
    "Amazon" => "https://m.media-amazon.com/images/G/01/primevideo/seo/primevideo-seo-logo.png",
    "Hulu" => "https://pics.paypal.com/00/c/gifts/us/hulu.jpg",
    "Disney+" => "https://www.datocms-assets.com/56706/1717753281-share-default-8bf3102623e935e7bc126df36b956b98.jpg",
    "Sky" => "https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/09/Sound-Vision-10-920x613.jpg",
    "ESPN+" => "https://static.foxbusiness.com/foxbusiness.com/content/uploads/2022/07/ESPN-logo.jpg",
    "NBA League Pass" => "https://image.roku.com/blog/wp-content/uploads/2023/01/NBA_SOS_ROKU_1200x628.jpg",
    "Eurosport" => "https://www.sportenstrategie.nl/uploads/_792x476_crop_center-center_none/Eurosport_logo.svg.png",
    "Xbox Game Pass" => "https://www.stuff.tv/wp-content/uploads/sites/2/2023/04/Game-Pass.png",
    "PlayStation Plus" => "https://image.api.playstation.com/vulcan/ap/rnd/202204/0810/803Pm8uJoZ2Cl9fJPvTaXHqG.png",
    "Steam" => "https://steamcdn-a.akamaihd.net/steam/support/faq/SteamWalletCard_Logo_Front_Blue.png",
    "Stitcher Premium" => "https://miro.medium.com/v2/resize:fit:5000/1*Jh4hncOxRYrrhQ0d8cgH1A.jpeg",
    "Luminary" => "https://img2.luminarypodcasts.com/v1/podcast/7f43d76b-8ee5-4b5e-bb01-5158ecdad535/thumbnail/h_360,w_360/image/s--g_rMoQvw--/aHR0cHM6Ly9tZWdhcGhvbmUuaW1naXgubmV0L3BvZGNhc3RzL2U3NDZkNDE4LWM2YzQtMTFlZS1iNjM1LThiOGMwMjFjZDk5OC9pbWFnZS8xNzA3MjU2NDIzMDEwLWMxYjQxZTJlOWM2MjJiN2MzNjUxZTNhMTZlNWI3NmM2LmpwZWc/aXhsaWI9cmFpbHMtNC4zLjEmbWF4LXc9MzAwMCZtYXgtaD0zMDAwJmZpdD1jcm9wJmF1dG89Zm9ybWF0LGNvbXByZXNz.jpeg",
    "Audible" => "https://m.media-amazon.com/images/I/41hlrYQzfXL.png",
    "Scribd" => "https://images.g2crowd.com/uploads/product/image/social_landscape/social_landscape_1af7c4c9bd76b1d6f4ee0ce55aa177fd/scribd.jpg",
    "Litres" => "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/76/ab/2b/76ab2b40-2039-d893-b9e8-9a9b31bd4e7d/app_icon-0-0-1x_U007epad-0-0-85-220.png/1200x630wa.png"
  }


Deal.all.each do |deal|
  # Find the corresponding image URL for the deal name
  image_url = deal_image_urls[deal.name]

  # If an image URL is found, update the deal's image_path
  if image_url
    deal.update(image_path: image_url)
    puts "Updated image for #{deal.name} with URL: #{image_url}"
  else
    puts "No image URL found for #{deal.name}, using default."
  end
end

puts "Seeding completed!"
