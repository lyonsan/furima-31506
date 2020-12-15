class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    order = Order.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order: order)
  end

end