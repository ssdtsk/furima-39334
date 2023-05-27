require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'メールアドレスは、＠を含む必要があること' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードは、半角英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードは、半角数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードは、全角文字を含むと登録できないこと' do
      @user.password = 'ｓaa111'
      @user.password_confirmation = 'ｓaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = 'wwwww55'
      @user.password_confirmation = 'wwwww66'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    #お名前の苗字もしくは名前が抜けていたバージョン
    it 'お名前(全角)は、名字が必須であること' do
      @user.first_name = ''
      @user.last_name = '雄二'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'お名前(全角)は、名前が必須であること' do
      @user.first_name = '佐藤'
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    #お名前を、漢字 ひらがな カタカナ以外で記述したバージョン
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'さとう1'
      @user.last_name = 'ゆうじ2'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'サトウ1'
      @user.last_name = 'ユウジ2'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = '佐藤1'
      @user.last_name = '雄二2'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    #お名前カナ 苗字もしくは名前が抜けていたバージョン
    it 'お名前カナ(全角)は、名字が必須であること' do
      @user.first_name_kana = 'サトウ'
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'お名前カナ(全角)は、名前が必須であること' do
      @user.first_name_kana = ''
      @user.last_name_kana = 'ユウジ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    #お名前カナ 苗字バージョン、名前バージョン
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'サトウ'
      @user.last_name_kana = '雄二'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '佐藤'
      @user.last_name_kana = 'ユウジ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end


    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    end
  end
end