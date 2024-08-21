class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Deal::CATEGORIES
  end

  def manage
    @subscriptions = current_user.subscriptions
    @deals = current_user.deals
  end
end
