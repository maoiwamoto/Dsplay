class Article < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader

# show画面で前後の投稿を取得

  def previous
    user.articles.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.articles.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  
  # 同じタグに属するレコードの前後を取得
  
  def prev_tag
    user.tag.articles.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next_tag
    user.tag.articles.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  
end