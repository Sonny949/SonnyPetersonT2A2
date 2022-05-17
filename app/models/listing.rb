class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :images # has_many_attached :image
  # accepts_nested_attributes_for :images, allow_destroy: true
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
end
