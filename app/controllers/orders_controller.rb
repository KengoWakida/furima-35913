class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンス生成
    #binding.pry
    @item = Item.find(params[:item_id])
  end

  def create
    #binding.pry
  end
end
