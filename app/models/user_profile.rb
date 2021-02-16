class UserProfile < ApplicationRecord
    belongs_to :user
    mount_uploader :avator, AvatorUploader
    mount_uploader :headerimage, HeaderimageUploader
    validates :name, presence: true
    validates :pagetitle, presence: true
    validates :profile, presence: true, length: {maximum: 15}
end
