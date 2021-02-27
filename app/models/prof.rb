class Prof < ApplicationRecord
    belongs_to :user
    mount_uploader :avator, AvatorUploader
    mount_uploader :headerimage, HeaderimageUploader
    validates :name, presence: true, length: {maximum: 10}
    validates :pagetitle, presence: true, length: {maximum: 35}
    validates :profile, presence: true, length: {maximum: 500}
end
