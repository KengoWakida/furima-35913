class ItemsController < ApplicationController
  #ログインしていないユーザーをログイン画面に遷移
  before_action :authenticate_user! ,only: [:new,:edit,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @items_count = Item.count
    @orders = Order.all
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
    @order_count = Order.where(item_id: @item.id).count
 
  end

  def edit
    @item = Item.find(params[:id])
    @order_count = Order.where(item_id: params[:id]).count
    redirect_to root_path unless current_user.id == @item.user_id
    if @order_count > 0 #商品が購入済の時
      redirect_to root_path 
    end
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

  def destroy
    item = Item.find(params[:id])
    #ログインユーザーと商品出品者が同じ場合
    if current_user.id == item.user_id  
      item.destroy
      redirect_to root_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:image,:product_name,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:days_id,:price).merge(user_id: current_user.id)
    end
end
