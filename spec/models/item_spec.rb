require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー商品出品' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      
    end

    context '商品出品がうまくいくとき' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'user_idが存在しなければ出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが40文字以上では登録できない' do
        @item.name = 'あいうえお かきくけこ さしすせそ たちつてと なにぬねの はひふへほ まみむめも やいゆえよ わ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'explanationが空では出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1000文字以上では登録できない' do
        @item.explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'categoryが空では出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'statusが空では出品できない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'postageが空では出品できない' do
        @item.postage = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_dayが空では出品できない' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字で入力されていなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceの範囲が￥300より上であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceの範囲が￥9.999.999より下であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end