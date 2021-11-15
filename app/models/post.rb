class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many_attached :pictures, service: :local
  validates :message, presence: true
  validates :pictures, size: { less_than: 5.megabytes, message: 'Image must be less than 5MB' },
                       content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
