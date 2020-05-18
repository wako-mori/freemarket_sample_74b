class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :comments dependent: :destroy
  # has_many :items dependent: :destroy
  # has_many :orders dependent: :destroy
  # has_many :credit_card 
  has_many :addresses


  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, presence: true
  validates :encrypted_password, presence: true, length:{minimum: 7 }
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end

