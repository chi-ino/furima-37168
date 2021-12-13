FactoryBot.define do
  factory :item do
    name            { '商品名' }
    category_id     { 2 }
    status_id       { 2 }
    postage_id      { 2 }
    prefecture_id   { 2 }
    shipping_day_id { 2 }

    association :user
  end
end
