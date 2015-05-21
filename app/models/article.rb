class Article < ActiveRecord::Base
        belongs_to :category
        has_and_belongs_to_many :tags
        mount_uploader :avatar, AvatarUploader
end
