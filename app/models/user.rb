class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  PASSWORD_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: PASSWORD_REGEX }
    validates :family_name, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :first_name, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :family_name_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :first_name_kana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :birth_day
 
  end
end
