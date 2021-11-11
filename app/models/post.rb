class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many_attached :pictures, service: :local
end
