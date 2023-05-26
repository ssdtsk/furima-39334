class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
       
       devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable 
       has_many :items
       has_many :orders

       validates :nickname, presence: true
       validates :email, presence: true, uniqueness: true
       validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は英字と数字の両方を含めて設定してください" }
       validates :password_confirmation, presence: true
       validates :password, confirmation: true
       validates :first_name, presence: true
       validates :last_name, presence: true
       validates :last_name_kana, presence: true
       validates :first_name_kana, presence: true
       validates :birthday, presence: true
  
  
end
