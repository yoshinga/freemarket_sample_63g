class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, :omniauth_providers => [:facebook]

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

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.save!
    end
  end
end
