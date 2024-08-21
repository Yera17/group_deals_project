class SubscriptionsController < ApplicationController
  def new
  end

  def create
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(params[:approved])
  end
end
