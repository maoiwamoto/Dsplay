class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  mount_uploader :image, ImageUploader
  validates :title, presence: true,length: {maximum: 35}
  validates :caption, length: {maximum: 1000}
  validates :image, presence: true

  
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
