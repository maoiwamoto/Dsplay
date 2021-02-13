class Article < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader



  def previous
    user.articles.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.articles.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  
end