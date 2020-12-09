require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規商品出品' do
    context '新規商品出品がうまくいく時' do
      it 'image,title,explanation,category_id,status_id,delivery_fee_id,prefecture_id,delivery_date_id,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上9999999円以下で出品できる' do
        price = 50000
        expect(@item).to be_valid
      end
    end

  end
end
