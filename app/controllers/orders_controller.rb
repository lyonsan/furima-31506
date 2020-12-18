class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  

  def order_params
    params.require(:order_address).permit(:user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
