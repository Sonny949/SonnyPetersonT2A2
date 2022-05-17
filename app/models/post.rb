class Post < ApplicationRecord
  belongs_to :user
  # there can be one image attached for a post
  has_one_attached :image # has_many_attached 

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
end
