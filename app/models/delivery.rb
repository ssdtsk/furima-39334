class Delivery < ApplicationRecord
  belongs_to :order

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, presence: true
  validates :municipalitie, presence: true
  validates :address, presence: true
  validates :tell, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Enter 10 or 11 digits' }
end