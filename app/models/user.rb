class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_one :address, dependent: :destroy
  has_many :items
  accepts_nested_attributes_for :address

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid)
    if user.present?
      unless sns_credential_record.present?
        SnsCredential.create(
          user_id: user.id,
          provider: auth.provider,
          uid: auth.uid
        )
      end
    elsif
      user = User.new(
        id: User.all.last.id + 1,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        nickname: auth.info.name,
        first_name: auth.info.last_name,
        family_name: auth.info.first_name,
      )
      SnsCredential.new(
        provider: auth.provider,
        uid: auth.uid,
        user_id: user.id
      )
    end 
  user
  end

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
