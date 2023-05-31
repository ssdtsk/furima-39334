require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '商品の出品登録' do
    context '出品ができるとき' do
    it 'imageとeproduct_name、product_descriptionが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
end
product_name, presence: true
  validates :product_description, presence: true
  validates :product_detail_category_id, presence: true
  validates :product_detail_condition_id, presence: true
  validates :delivery_charge_id,presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence
describe 'attributes' do
  let(:item) { FactoryBot.build(:item) }

  it 'has a product name' do
    expect(item.product_name).to be_present
  end

  it 'has a product description' do
    expect(item.product_description).to be_present
  end

  it 'has a product detail category ID' do
    expect(item.product_detail_category_id).to start_with('z5')
  end

  it 'has a product detail condition ID' do
    expect(item.product_detail_condition_id).to be_present
  end

  it 'has a delivery charge ID' do
    expect(item.delivery_charge_id).to be_present
  end

  it 'has a prefecture ID' do
    expect(item.prefecture_id).to be_present
  end

  it 'has a delivery day ID' do
    expect(item.delivery_day_id).to be_present
  end

  it 'has a price' do
    expect(item.price).to be_present
  end
end
end