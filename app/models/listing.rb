class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :image# has_many_attached :image
end
