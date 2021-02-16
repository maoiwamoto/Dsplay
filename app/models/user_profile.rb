class UserProfile < ApplicationRecord
    belongs_to :user
    mount_uploader :avator, AvatorUploader
    mount_uploader :headerimage, HeaderimageUploader
    validates :name, presence: true, length: {maximum: 15}
    validates :pagetitle, presence: true, length: {maximum: 30}
    validates :profile, presence: true, length: {maximum: 500}
end
