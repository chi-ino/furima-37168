class CardBuyer
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :text, :price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end
  

  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number,
                 prefecture_id: prefecture_id, card_id: card.id)
  end
end
