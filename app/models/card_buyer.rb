class CardBuyer
  ActiveModel::Model
  attr_accessor :user_id, :item_id, :text, :price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code 
    validates :address
    validates :building
    validates :phone_number
  end
  validates :prefecture_id
  
  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, city: city, address: address, building:🇲building, phone_number: phone_number, prefecture_id: prefecture_id,card_id: card.id)
  end

end