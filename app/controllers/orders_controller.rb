class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンス生成
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping).permit(:postal_code,:prefecture_id,:unicipality,:address,:building,:tel_number).merge(item_id: @item.id,user_id: current_user.id,token: params[:token])
  end
end
