class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :fishlists, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
end
