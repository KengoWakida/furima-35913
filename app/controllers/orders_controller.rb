class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンス生成
    #binding.pry
    #選択した商品
    @item = Item.find(params[:item_id])
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    #binding.pry
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:postal_code,:prefecture_id,:unicipality,:address,:building,:tel_number,:item_id).merge(user_id: current_user.id)
  end
end
