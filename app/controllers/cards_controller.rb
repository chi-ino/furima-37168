class CardsController < ApplicationController
  before_action :set_card, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index
  
  def index
    @card_buyer = CardBuyer.new
  end
  
  def create
    @card_buyer = CardBuyer.new(card_params)
    if @card_buyer.valid?
      pay_item
      @card_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def card_params
    params.require(:card_buyer).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
  

  def set_card
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: card_params.price, 
      card: card_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    if current_user == @item.user || @item.card != nil
      redirect_to root_path
    end
  end
end
