class ItemsController < ApplicationController
  #ログインしていないユーザーをログイン画面に遷移
  before_action :authenticate_user! ,only: [:new,:edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:image,:product_name,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:days_id,:price).merge(user_id: current_user.id)
    end
end
