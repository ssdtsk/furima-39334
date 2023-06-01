require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)  
    @item = FactoryBot.build(:item, user: @user)  
  end

  describe '商品の出品登録' do
    context '出品ができるとき' do
      it '全項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

  context '商品の出品ができないとき' do
    it '画像が必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it 'カテゴリーの情報が初期値の1以外であること' do
      @item.product_detail_category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product detail category must be other than 1")
    end
    it '商品の状態の情報が初期値の1以外であること' do
      @item.product_detail_condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product detail condition must be other than 1")
    end
    it '配送料の負担の情報が初期値の1以外であること' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end
    it '発送元の地域の情報が初期値の1以外であること' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数の情報が初期値の1以外であること' do
      @item.delivery_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end
    it '価格の情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は、300円以上のみ保存可能であること' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格は、9,999,999円以下のみ保存可能であること' do
      @item.price = '99999999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格は半角数値のみ保存可能であること' do
      @item.price = '４０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '出品機能とユーザーが紐づいていること' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end
