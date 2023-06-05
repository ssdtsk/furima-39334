class OrderForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalitie, :building, :address, :tell
  
  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality:       {other_than: 0, message: "can't be blank"}
    validates :municipalitie, presence: true
    validates :address, presence: true
    validates :tell, presence: true, format:      { with: /\A\d{10,11}\z/, message: 'is invalid. Enter 10 or 11 digits' }
  end
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipalitie: municipalitie, address: address, building: building, tell: tell, order_id: order.id)
  end
end
