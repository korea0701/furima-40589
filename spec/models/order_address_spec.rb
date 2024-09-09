require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  context '配送先情報が正しい場合' do
    it '全ての情報が正しいときは保存できる' do
      expect(@order_address).to be_valid
    end
  end

  context '配送先情報が正しくない場合' do
    it '郵便番号が空の場合は保存できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が「3桁ハイフン4桁」の半角数字でない場合は保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it '都道府県が選択されていない場合は保存できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be selected')
    end

    it '市区町村が空の場合は保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空の場合は保存できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空の場合は保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が10桁未満の場合は保存できない' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が12桁以上の場合は保存できない' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が半角数値でない場合は保存できない' do
      @order_address.phone_number = '０9012345678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
  end

  context '正常に購入ができる場合' do
    it '全ての情報が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end
  end

  context '購入ができない場合' do
    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
