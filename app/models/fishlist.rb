class Fishlist < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

    has_many_attached :fishimg
    belongs_to :user
    has_many :comments, dependent: :destroy
end
