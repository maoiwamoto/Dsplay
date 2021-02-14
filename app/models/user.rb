class User < ApplicationRecord
  has_many :posts
  has_many :articles
  has_many :tags
  has_one :user_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
