class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def author
    "#{user.first_name} #{user.last_name}"
  end

  validates :comment_text, presence: true
end
