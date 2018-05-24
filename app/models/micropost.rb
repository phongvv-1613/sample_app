class Micropost < ApplicationRecord
  belongs_to :user

  scope :order_by_created_at, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: { maximum: Settings.micropost.max_length}
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.micropost.picture_size.megabytes
    errors.add(:picture, t(".picture_size"))
    end
  end
end
