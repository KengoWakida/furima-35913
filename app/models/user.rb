class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        #パスワードが半角英数字で混合しなければいけない
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid.Include both letters and numbers"}
         #バリデーション カラムが空では保存できない
      with_options presence: true do
         validates :nickname   
        #漢字、ひらがな、カタカナのみ許可
         validates :lastname,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
         validates :firstname,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
         #カタカナのみ許可
         validates :lastname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
         validates :firstname_kana,  format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
         validates :birthday
      end

      has_many :items
end
