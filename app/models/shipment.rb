class Shipment < ApplicationRecord
  belongs_to :listing
  belongs_to :buying_user, class_name: 'User'
  belongs_to :selling_user, class_name: 'User'
end
