class Oder
  ActiveModel::Model
  attr_accessor :user_id, :item_id, :text, :price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は(−)を入れて7文字で入力してください' }
    validates :prefecture_id  numericality: { other_than: 1, message: "は−−以外を選択してください" }
    validates :city
    validates :address
    validates :building
    validates :phone_number   numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  end

  def save
    card = Card.create( item_id: item_id, user_id: user_id)
    Address.create (postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    phone_number: phone_number, card_id: card.id)  )
  end
end