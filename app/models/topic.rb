class Topic < ApplicationRecord

  belongs_to :user

  # has_many_attached :images

  mount_uploader :post, PostUploader

  counter_culture :user


end
