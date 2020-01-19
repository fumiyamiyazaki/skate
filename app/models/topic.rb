class Topic < ApplicationRecord

  has_many_attached :images

  belongs_to :user

  counter_culture :user

  # mount_uploader :image, ImageUploader

end
