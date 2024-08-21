class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :deal

end

# CATEGORIES = ["music", "video", "TV", "sports", "gaming", "podcast", "audiobook"]
