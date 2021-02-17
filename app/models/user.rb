class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one :prof, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
def tags
return Tag.where(user_id: self.id)
end
         
end
