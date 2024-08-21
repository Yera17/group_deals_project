class Deal < ApplicationRecord
  belongs_to :user
  has_many :subscriptions
  CATEGORIES = ["music", "video", "TV", "sports", "gaming", "podcast", "audiobook"]

  validates :name, :duration, :number_of_users, presence: true
  validates :price, numericality: true, presence: true
  validates :category, inclusion: { in: CATEGORIES,
                                    message: "not in category" }, presence: true
  validates :number_of_users, length: { maximum: 5 }
end
