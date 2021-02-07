class Tag < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :articles, dependent: :nullify
end
