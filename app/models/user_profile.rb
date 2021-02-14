class UserProfile < ApplicationRecord
    belongs_to :user
    mount_uploader :avator, AvatorUploader
    mount_uploader :headerimage, HeaderimageUploader
end
