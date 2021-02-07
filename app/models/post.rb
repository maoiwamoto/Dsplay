class Post < ApplicationRecord
  belongs_to :tag, optional: true
  has_one_attached :image
end
