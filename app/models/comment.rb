class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :articles
    validates :user_id, presence: true
    validates :article_id, presence: true
end
