FactoryBot.define do
  factory :card_buyer do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京' }
    address { '1-1' }
    building { 'tokyo' }
    phone_number { '1234567890' }
  end
end