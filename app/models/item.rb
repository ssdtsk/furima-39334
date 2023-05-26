class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_detail_category_id, presence: true
  validates :product_detail_condition_id, presence: true
  validates :delivery_charge_id,presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
