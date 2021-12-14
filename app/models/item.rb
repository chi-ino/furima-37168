class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  # ジャンルの選択が「--」の時は保存不可
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :postage_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  end
end
