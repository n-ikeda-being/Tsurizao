class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :fishlists, dependent: :destroy
  has_many :comments, dependent: :destroy
  VALID_NAME_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 },format: { with: VALID_NAME_REGEX, message: 'は半角英数を両方含む必要があります'}
end
