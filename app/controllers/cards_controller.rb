class CardsController < ApplicationController

  def index
    @card_buyer = CardBuyer.new
    @item = Item.find(params[:item_id])
    

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
    params.permit(:card_buyer).permit(:item_id, :postal_code, :city, :address, :building, :phone_number, :prefecture_id)
  end
  



end
