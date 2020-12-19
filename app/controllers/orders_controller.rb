class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    set_item
  end

  def create
    @order_address = OrderAddress.new(order_params)
    set_item
    @user = User.find(current_user.id)
    if @order_address.valid?
      pay_item(@item)
      @order_address.save(@user, @item)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  

  def order_params
    #ストロングパラメータでは、permitに設定するものはフォームで入力して受け取るもの、それ以外(今回でいうとuser_id)は
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
  
  def pay_item(item)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
