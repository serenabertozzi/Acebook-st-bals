class User < ApplicationRecord
  def display_profile_photo
    if profile_photo.attached?
      profile_photo
    else
      '/teamlogo.png'
    end
  end

  has_one_attached :profile_photo, service: :local
  has_many :posts

  # adds virtual attributes for authentication
  # adds methods to set and authenticate against the bcrypt password
  # must use the naming convention xxx_digest where xxx is the attribute name of our desired password
  # https://edgeapi.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
  # validates email

  has_many :likes
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :profile_photo, size: { less_than: 1.megabytes, message: 'Image is too big' },
                            content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
