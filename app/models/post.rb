class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  mount_uploader :image, ImageUploader
  validates :title, length: {maximum: 50}
  validates :caption, length: {maximum: 1000}
  validates :image, presence: true
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end
