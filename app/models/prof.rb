class Prof < ApplicationRecord
    belongs_to :user
    mount_uploader :avator, AvatorUploader
    mount_uploader :headerimage, HeaderimageUploader
    validates :name, presence: true, length: {maximum: 15}
    validates :pagetitle, presence: true, length: {maximum: 25}
    validates :profile, presence: true, length: {maximum: 300}
end
