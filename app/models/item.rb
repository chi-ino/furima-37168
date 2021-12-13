class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  
   # アクティブハッシュとのアソシエーション
  belongs_to :category

  validates  :name, null: false
  validates  :explanation, null: false 
  validates  :category_id, null: false
  validates  :status_id, null: false
  validates  :postage_id, null: false
  validates  :prefecture_id, null: false
  validates  :shipping_day_id, null: false
  validates  :price, null: false
  validates  :user, null: false


end
