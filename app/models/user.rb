class User < ApplicationRecord
  rolify
  has_one :address, dependent: :destroy
  has_many :listings
  has_many :posts
  has_many :buying_user_shipments, class_name: 'Shipment', foreign_key: 'buying_user_id'
  has_many :selling_user_shipments, class_name: 'Shipment', foreign_key: 'selling_user_id'
  accepts_nested_attributes_for :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :confirmable

  def with_address
    build_address if address.nil?
    self
  end
end
