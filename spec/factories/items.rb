FactoryBot.define do
  factory :item do
    name            { '商品名' }
    explanation     { '説明文' }
    price           { 2000 }
    category_id     { 2 }
    status_id       { 2 }
    postage_id      { 2 }
    prefecture_id   { 2 }
    shipping_day_id { 2 }
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
