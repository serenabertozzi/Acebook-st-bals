class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many_attached :pictures, service: :local
  validates :message, presence: true

  def likes_count
    self.likes.count
  end
  
end
