class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:product_name,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:days_id,:price,:user_id)
    end

end
