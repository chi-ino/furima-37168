class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
