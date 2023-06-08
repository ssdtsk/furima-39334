require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user) 
    @orderform = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入' do
    context '購入ができるとき' do
      it '全項目が入力されていれば登録できる' do
        expect(@orderform).to be_valid
      end
      it '建物名が空でも購入できる' do
        @orderform.building = ''
        expect(@orderform).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it '郵便番号が必須であること' do
        @orderform.post_code = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は3桁ハイフン4桁のみ保存可能であること' do
        @orderform.post_code = '1234567'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号は半角文字列のみ保存可能であること' do
        @orderform.post_code = '１２３-４５６７'
        @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が必要であること' do
        @orderform.prefecture_id = '0'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必要であること' do
        @orderform.municipalitie = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Municipalitie can't be blank")
      end
      it '番地が必要であること' do
        @orderform.address = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必要であること' do
        @orderform.tell = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Tell can't be blank")
      end
      it '電話番号は10ケタ以上のみ保存可能であること' do
        @orderform.tell = '090123456'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Tell is invalid. Enter 10 or 11 digits")
      end
      it '電話番号は11ケタ以内のみ保存可能であること' do
        @orderform.tell = '090123456789'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Tell is invalid. Enter 10 or 11 digits")
      end
      it '電話番号は半角数字のみ保存可能であること' do
        @orderform.tell = '090-1234-5678'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Tell is invalid. Enter 10 or 11 digits")
      end
      it 'tokenが空では登録できないこと' do
        @orderform.token = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @orderform.user_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @orderform.item_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
