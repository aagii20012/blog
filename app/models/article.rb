class Article < ActiveRecord::Base
    acts_as_punchable
    acts_as_commontable
    belongs_to :user
    has_many :comments
    #has_many :user,through: :comments
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :user_id, presence: true
end