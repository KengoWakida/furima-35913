class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #バリデーション カラムが空では保存できない
         validates :nickname,           presence: true
         validates :lastname,           presence: true
         validates :firstname,          presence: true
         validates :lastname_kana,      presence: true
         validates :firstname_kana,     presence: true
         validates :birthday,           presence: true
end
