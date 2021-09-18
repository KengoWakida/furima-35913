class ItemsController < ApplicationController
  #ログインしていないユーザーをログイン画面に遷移
  before_action :authenticate_user! ,only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
    @items_count = Item.count
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:image,:product_name,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:days_id,:price).merge(user_id: current_user.id)
    end

end
