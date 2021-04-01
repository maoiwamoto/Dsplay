class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one :prof, dependent: :destroy
  attr_accessor :profs_attributes
  accepts_nested_attributes_for :prof
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :lockable
         
  validate :password_complexity
def password_complexity
  return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
  errors.add :password, "強度が不足しています。大文字と小文字と数字と特殊文字をそれぞれ1文字以上含める必要があります。"
end
         
def tags
return Tag.where(user_id: self.id)
end

def posts
return Post.where(user_id: self.id)
end

def articles
return Article.where(user_id: self.id)
end
         
end