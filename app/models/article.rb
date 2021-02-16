class Article < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, length: {maximum: 50}
  validates :body, presence:true, length: {maximum: 3000}

# show画面で前後の投稿を取得

  def previous
    user.articles.order('id desc').where('id < ?', id).first
  end

  def next
    user.articles.order('id desc').where('id > ?', id).reverse.first
  end
  
  # 同じタグに属するレコードの前後を取得
  
  def prev_tag
    tag.articles.order('id desc').where('id < ?', id).first
  end

  def next_tag
    tag.articles.order('id desc').where('id > ?', id).reverse.first
  end
  
end