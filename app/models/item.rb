class Item < ApplicationRecord
  has_many :images, dependent: :destroy
end
