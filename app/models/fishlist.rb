class Fishlist < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

    has_many_attached :fishimg
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
        %w[date prefecture_name prefecture_id place fishname fishingmethod user_name]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

    def favorited?(user)
        favorites.where(user_id: user.id).exists?
    end
end
