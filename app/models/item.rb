class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  # the picture the user takes when scanning a clothing item.
  # use item.image.attached? to check for an image
end
