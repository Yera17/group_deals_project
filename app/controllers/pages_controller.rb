class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Deal::CATEGORIES
    @categories_with_images = {
        "music" => "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
        "video" => "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
        "TV" => "https://www.lg.com/nl/lg-experience/images/lg-lab/2023/what-is-a-smart-tv/lg-experience-lg-lab-what-is-a-smart-tv-key-visual.jpg",
        "sports" => "https://images.unsplash.com/photo-1517649763962-0c623066013b",
        "gaming" => "https://images.unsplash.com/photo-1535223289827-42f1e9919769",
        "podcast" => "https://images.unsplash.com/photo-1504386106331-3e4e71712b38",
        "audiobook" => "https://images.unsplash.com/photo-1512820790803-83ca734da794"
      }
  end

  def manage
    @subscriptions = current_user.subscriptions
    @deals = current_user.deals
    @received_subscriptions = current_user.received_subscriptions
  end
end
