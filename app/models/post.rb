class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(created_at: :desc)}, inverse_of: :post, dependent: :destroy
  scope :with_comments, ->(include) { includes(:comments) if include.present? && include.to_bool }
  has_many :likes, dependent: :destroy
  has_many_attached :pictures, service: :local
  validate :has_at_least_one_user_input_attr
  validates :pictures, size: { less_than: 5.megabytes, message: 'Image must be less than 5MB' },
                       content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']

  def likes_count
    self.likes.count
  end

  private

  def has_at_least_one_user_input_attr
    if message.blank? && video_url.blank? && pictures.empty?
      errors.add :base, "Must contain Message, Picture or Video"
    end
  end

end
