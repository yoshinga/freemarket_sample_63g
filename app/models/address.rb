class Address < ApplicationRecord

  belongs_to :user ,optional: true

  validates :postal_code,        presence: true
  validates :prefecture,         presence: true
  validates :city,               presence: true
  validates :house_number,       presence: true
  # validates :building_name     
  # validates :user_id,            foreign_key: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  # delegate :name, to: :prefecture
end
