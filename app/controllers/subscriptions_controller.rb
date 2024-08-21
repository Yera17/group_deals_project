class SubscriptionsController < ApplicationController
  def new
  end

  def create
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(checked: true)
    subscription.update(approved: params[:approved])
    redirect_to manage_path
  end
end
