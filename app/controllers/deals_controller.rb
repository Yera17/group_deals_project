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
    @subdeals = ["Netflix","Amazon Prime","KPN"]
    @subdeals_with_images = {
      "netflix"=>"https://i.pcmag.com/imagery/reviews/05cItXL96l4LE9n02WfDR0h-5.fit_scale.size_1028x578.v1582751026.png",
      "amazon"=>"https://m.media-amazon.com/images/G/01/primevideo/seo/primevideo-seo-logo.png",
      "KPN"=>"https://uploads-eu-west-1.insided.com/kpn-nl/attachment/795740cb-2b5d-4ef6-b27c-5bfebf9b8736_thumb.png"
    }
  end

  def show
    @deal = Deal.find(params[:id])
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :price, :description, :category, :duration, :number_of_users)
  end
end
