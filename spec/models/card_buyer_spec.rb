require 'rails_helper'

RSpec.describe CardBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @card_buyer = FactoryBot.build(:card_buyer, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@card_buyer).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @card_buyer.building = ''
        expect(@card_buyer).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'postal_codeが空だと保存できない' do
        @card_buyer.postal_code = ''
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @card_buyer.postal_code = '1234567'
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idを選択していないと保存できない' do
        @card_buyer.prefecture_id = 1
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @card_buyer.city = ''
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @card_buyer.address = ''
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @card_buyer.phone_number = ''
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以内では保存できない' do
        @card_buyer.phone_number = '123456789'
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上の半角数値では保存できない' do
        @card_buyer.phone_number = '123456789012'
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phoneがハイフンを省かなければ購入できない' do
        @card_buyer.phone_number = '090-1234-5678'
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phoneが半角数値でなければ購入できない' do
        @card_buyer.phone_number = '０９０１２３４５６７８'
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'itemが紐付いていないと購入できない' do
        @card_buyer.item_id = nil
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと購入できない' do
        @card_buyer.user_id = nil
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では購入できない' do
        @card_buyer.token = nil
        @card_buyer.valid?
        expect(@card_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
