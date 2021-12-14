class ItemsController < ApplicationController
    # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params) #バリデーションを通過した時
      redirect_to root_path
    else #バリデーションに引っかかった時
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
