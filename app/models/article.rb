class Article < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
