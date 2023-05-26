class User < ApplicationRecord

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
       
       devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable 
       has_many :items
       has_many :orders

       validates :nickname, presence: true
       validates :email, presence: true, uniqueness: { case_sensitive: true }
       validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}
       validates :password_confirmation, presence: true
       validates :password, confirmation: true
       validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
       validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
       validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
       validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
       validates :birthday, presence: true
  
  
end
