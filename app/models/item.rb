class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  
   # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :pastage
  belongs_to :prefecture
  belongs_to :shipping_day

  validates  :name, presence: true
  validates  :explanation, presence: true
  validates  :category_id, presence: true
  validates  :status_id, presence: true
  validates  :postage_id, presence: true
  validates  :prefecture_id, presence: true
  validates  :shipping_day_id, presence: true
  validates  :price, presence: true
  validates  :user, presence: true

  # ジャンルの選択が「--」の時は保存不可
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }


end
