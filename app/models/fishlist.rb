class Fishlist < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

    has_one_attached :fishimg
end
