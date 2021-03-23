class Article < ActiveRecord::Base
    acts_as_punchable
    acts_as_commontable
    has_many :comment
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :user_id, presence: true
end