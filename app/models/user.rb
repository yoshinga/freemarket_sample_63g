class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname,               presence: true, length: {maximum: 20}
  validates :email,                  presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false} 
  validates :password,               presence: true
  validates :password_confirmation,  presence: true
  validates :family_name,            presence: true
  validates :first_name,             presence: true
  validates :family_kana_name,       presence: true
  validates :first_kana_name,        presence: true
  validates :telephone_number,       presence: true
  validates :card_number,            presence: true
  validates :month,                  presence: true
  validates :year,                   presence: true
  validates :code,                   presence: true
end
