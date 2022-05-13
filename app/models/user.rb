class User < ApplicationRecord
  rolify
  has_one :address, dependent: :destroy
  has_many :listings
  has_many :posts
  accepts_nested_attributes_for :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, #:confirmable

  def with_address
    build_address if address.nil?
    self
  end
end
