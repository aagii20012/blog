class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :user_id, presence: true
    validates :articles_id, presence: true
end
