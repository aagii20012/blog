class Image < ApplicationRecord
    belongs_to :Banner
    has_one_attached :banner_image
end
