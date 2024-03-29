class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :fishlists, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }

  has_many :relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :reverse_of_relationships, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.find_or_create_by(followed_id: user_id)
  end

  # フォローを外すときの処理
  def unfollow(user_id)
    relationship = relationships.find_by(followed_id: user_id)
    relationship&.destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
