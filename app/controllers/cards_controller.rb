class CardsController < ApplicationController

  def index
    @card_buyer = Cardbuyer.new
  end
end
