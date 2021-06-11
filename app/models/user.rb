class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


       with_options presence: true do
         validates :nickname
         validates :birth_date
         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"} do
              validates :first_name
              validates :last_name
       end
       with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."} do
              validates :first_name_kana
              validates :last_name_kana
       end
       end
       validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, message: "is invalid" }
       
       has_many :items
       has_many :buys
       has_many :sell_items

end
