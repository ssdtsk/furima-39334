class User < ApplicationRecord

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
        
       has_many :items
       has_many :orders

       validates :nickname, presence: true
       validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}
       validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
       validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
       validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
       validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
       validates :birthday, presence: true
  
  
end
