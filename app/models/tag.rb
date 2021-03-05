class Tag < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :articles, dependent: :nullify
    belongs_to :user
    validates :name, presence:true, length: {maximum:25}
    validates :caption, length: {maximum: 1000}
    
    def user
    return User.find_by(id: self.user_id)
    end
end
