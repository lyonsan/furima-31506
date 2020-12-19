require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    context '商品購入がうまくいく時' do
      it 'postal_code, prefecture_id, city, address, building, phone_number, tokenがあれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingがなくても出品できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postal_codeがないと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code にはハイフンつきの数字を入力してください'
      end

      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it 'cityがないと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'addressがないと購入できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberがないと登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが数字でないと登録できない' do
        @order_address.phone_number = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number には数字を入力してください'
      end

      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
