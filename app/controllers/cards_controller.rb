class CardsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_card, only: [:index, :create]
  before_action :move_to_index
  
  def index
    @card_buyer = CardBuyer.new
  end
  
  def create
    @card_buyer = CardBuyer.new(card_params)
    if @card_buyer.valid?
      @card_buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def card_params
    params.permit(:card_buyer).permit(:item_id, :postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
  

  def set_card
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user || @item.card != nil
      redirect_to root_path
    end
  end
end
