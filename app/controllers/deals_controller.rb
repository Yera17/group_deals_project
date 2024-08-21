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
  end

  def show
    @deal = Deal.find(params[:id])
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :price, :description, :category, :duration, :number_of_users)
  end
end
