class Comment < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
