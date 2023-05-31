class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :product_detail_category
  belongs_to :product_detail_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_detail_category_id, presence: true
  validates :product_detail_condition_id, presence: true
  validates :delivery_charge_id,presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  validates :product_detail_category_id, numericality: { other_than: 1 } 
  validates :product_detail_condition_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
end
