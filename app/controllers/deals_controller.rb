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
    @approved_subs = @deal.subscriptions.where(approved: true)
    @available_spots = @deal.number_of_users.to_i - @approved_subs.length
    if user_signed_in?
      current_user.subscriptions.each do |sub|
        if @deal == sub.deal
          @user_deal = @deal
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update(deal_params)
      redirect_to deal_path(@deal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    # No need for app/views/deals/destroy.html.erb
    redirect_to root_path, status: :see_other
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :price, :description, :category, :duration, :number_of_users, :image_path)
  end
end
