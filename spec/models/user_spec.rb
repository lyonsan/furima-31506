require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'email,password,password_confirmation,nickname,last_name,first_name,last_name_kana,first_name_kana,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'ユーザー名が全角（漢字/ひらがな/カタカタ）で入力されることで登録できる' do
        @user.last_name = '山ダ'
        @user.first_name = '太ろウ'
        expect(@user).to be_valid
      end
      it 'ユーザー名のフリガナが全角（カタカナ）で入力されることで登録できる' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'メールアドレスがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'email'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'メールアドレスが重複していると登録できない' do
        @user.email = 'aaa@mail.com'
        @user.save
        @user1 = FactoryBot.build(:user)
        @user1.email = 'aaa@mail.com'
        @user1.valid?
        expect(@user1.errors.full_messages).to include 'Email has already been taken'
      end
      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = '55555'
        @user.password_confirmation = '55555'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードとパスワード（確認用）の値が一致しないと登録できない' do
        @user.password = '666fff'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードが半角英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = "666666"
        @user.password_confirmation = "666666"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'ニックネームがないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it '苗字がないと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '名前がないと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '苗字が全角（漢字/ひらがな/カタカナ）でないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name に全角文字（漢字/ひらがな/カタカナ）を使用してください'
      end
      it '名前が全角（漢字/ひらがな/カタカナ）でないと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name に全角文字（漢字/ひらがな/カタカナ）を使用してください'
      end
      it '苗字カナがないと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it '名前カナがないと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '苗字カナが全角カタカナでないと登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana に全角カナを使用してください'
      end
      it '名前カナが全角カタカナでないと登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana に全角カナを使用してください'
      end
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
