class OrdersController < ApplicationController
 #ログインしていないユーザーをログイン画面に遷移
 before_action :authenticate_user! ,only: [:index]

  def index
    #フォームオブジェクトのインスタンス生成
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
    #商品が購入済の時はトップ画面に遷移
    @order_count = Order.where(item_id: params[:item_id]).count
    if (@order_count > 0) || (current_user.id == @item.user_id)
      redirect_to root_path 
    end
    # if current_user.id == @item.user_id
    #   redirect_to root_path 
    # end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping)\
          .permit(:postal_code,:prefecture_id,:unicipality,:address,:building,:tel_number)\
          .merge(item_id: @item.id,price: @item.price, user_id: current_user.id,token: params[:token])
  end

  #PayJpの決済処理
  def pay_item  
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]             #テスト秘密鍵
      Payjp::Charge.create(
      amount: order_params[:price],                       #商品の価格
      card: order_params[:token],                         #カードトークン
      currency: 'jpy'                                     #通貨 円
    )
  end
end
