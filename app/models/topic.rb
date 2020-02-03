class Topic < ApplicationRecord
  validates :post, presence: true

  belongs_to :user

  # has_many_attached :images

  mount_uploader :post, PostUploader

  counter_culture :user

  def self.search(search)
    return Topic.all unless search
    Topic.where('text LIKE(?)', "%#{search}%")
  end

end
