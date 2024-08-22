class SubscriptionsController < ApplicationController
  def new
  end

  def create
    @subscription = Subscription.new({ deal_id: params[:deal_id], user_id: current_user.id })
    if @subscription.save
      redirect_to manage_path
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update({ checked: true, approved: params[:approved] })
    redirect_to manage_path
  end
end
