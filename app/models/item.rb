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

  validates  :name, null: false
  validates  :explanation, null: false 
  validates  :category_id, null: false
  validates  :status_id, null: false
  validates  :postage_id, null: false
  validates  :prefecture_id, null: false
  validates  :shipping_day_id, null: false
  validates  :price, null: false
  validates  :user, null: false
  
  # ジャンルの選択が「--」の時は保存不可
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }


end
