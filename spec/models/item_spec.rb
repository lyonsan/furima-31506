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
        @item.price = 50000
        expect(@item).to be_valid
      end
    end
    context '新規商品出品がうまくいかない時' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleがないと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'explanationがないと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'delivery_fee_idが1だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'delivery_date_idが1だと出品できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date must be other than 1"
      end
      it 'priceがないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300~9999999円の範囲でないと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は販売価格の範囲外です"
      end
      it 'priceが半角でないと出品できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price には半角数字を入力してください"
      end
    end
  end
end
