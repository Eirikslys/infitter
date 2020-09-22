class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  # the picture the user takes when scanning a clothing item.
  # use item.image.attached? to check for an image
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
end
