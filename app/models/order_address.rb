class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフンつきの数字を入力してください' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'には数字を入力してください' }
    validates :phone_number, length: {in: 1..11, message: 'は11桁以内の数字を入力してください'}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
