class OrdersController < ApplicationController
  def index
    @item = Item.find(item_params)
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def order_params
    @item = Item.find(item_params)
    params.require(:order_address).permit(:user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], price: @item.price )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
