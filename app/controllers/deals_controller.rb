class DealsController < ApplicationController
  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.user = current_user
    if @deal.save
      redirect_to deal_path(@deal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @deals = Deal.where(category: params[:category])
    @category = params[:category]
  end

  def show
    @user_deal = ""
    @deal = Deal.find(params[:id])
    current_user.subscriptions.each do |sub|
      if @deal == sub.deal
        @user_deal = @deal
      end
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :price, :description, :category, :duration, :number_of_users)
  end
end
