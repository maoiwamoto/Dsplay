class Tag < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :articles, dependent: :nullify
    belongs_to :user
    validates :name, presence:true, length: {maximum: 50}
  　validates :caption, length: {maximum: 1000}
end
