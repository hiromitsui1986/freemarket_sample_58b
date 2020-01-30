class User < ApplicationRecord

  has_many :products


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_address
  accepts_nested_attributes_for :user_address
  has_one :card_info
  accepts_nested_attributes_for :card_info

  validates :nickname,
            :email,
            :password,
            :family_name,
            :first_name, 
            :family_name_kana,
            :first_name_kana,
            :birthday,
            presence: true
  validates :password, length: { minimam: 7, maximum: 128 }
  validates :family_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :family_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}

end
