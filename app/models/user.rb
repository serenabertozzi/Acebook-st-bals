class User < ApplicationRecord
  # adds virtual attributes for authentication
  # adds methods to set and authenticate against the bcrypt password
  # must use the naming convention xxx_digest where xxx is the attribute name of our desired password
  # https://edgeapi.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
  # validates email
  validates :email, presence: true, uniqueness:true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  has_many :likes 
end
