class OrdersController < ApplicationController
  def index
    @item = Item.find(item_params)
    @order_address = OrderAddress.new
  end

  def create
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
