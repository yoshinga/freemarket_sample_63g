class Item < ApplicationRecord

  # active_hash用の記述です↓
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliverydays

  # 同じ種類のバリデーションを複数のカラムに一括指定しています↓
  with_options presence: true do
    validates :item_name
    validates :discription
    validates :burden_id
    validates :prefecture_id
    validates :condition_id
    validates :price
    # validates :delivery_fee
    validates :deliverydays_id
    # validates :items_status
  end
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

end

