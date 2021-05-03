class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :background_image, ImageUploader
end
