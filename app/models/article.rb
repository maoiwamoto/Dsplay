class Article < ApplicationRecord
  belongs_to :tag, optional: true
  mount_uploader :photo, PhotoUploader
end
