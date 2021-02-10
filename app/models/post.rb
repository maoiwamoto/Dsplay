class Post < ApplicationRecord
  belongs_to :tag, optional: true
  mount_uploader :image, ImageUploader
end
