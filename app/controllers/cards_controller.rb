class CardsController < ApplicationController

  def index
    @card_buyer = Cardbuyer.new
  end
  
  def create
    @card_buyer = Cardbuyer.new（card_params)
    if @card_buyer.valid?
      pay_item
      @card_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def  @card_buyer
    params.permit(:card_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end



end
