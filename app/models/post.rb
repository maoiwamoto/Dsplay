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
  
  # show画面で前後の投稿を取得

  def previous
    user.posts.order('id desc').where('id < ?', id).first
  end

  def next
    user.posts.order('id desc').where('id > ?', id).reverse.first
  end
  
  # 同じタグに属するレコードの前後を取得
  
  def prev_tag
    tag.posts.order('id desc').where('id < ?', id).first
  end

  def next_tag
    tag.posts.order('id desc').where('id > ?', id).reverse.first
  end
  
  
end
