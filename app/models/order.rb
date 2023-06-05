class Order < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :user_id, :item_id

  validates :user_id, presence: true
  validates :item_id, presence: true
  has_one :delivery

  def save
    if valid?
      order = Order.new(user_id: user_id, item_id: item_id)
      order.save
      true
    else
      false
    end
  end
end