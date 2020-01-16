class Topic < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  # mount_uploader :image, ImageUploader

end
