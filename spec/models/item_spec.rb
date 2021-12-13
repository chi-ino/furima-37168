require 'rails_helper'

RSpec.describe Item, type: :model do
  describe'商品出品'do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  
  it '商品の状態の情報が必須であること' do
    @item.status = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it '配送料の負担の情報が必須であること' do
    @item.postage = nil
    @item.valid?
  end

  it '配送元の地域が必須であること' do
    @item.prefecture = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '発送日が必須であること' do
    @item.shipping_day = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end
end


end
