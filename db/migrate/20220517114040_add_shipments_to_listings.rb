class AddShipmentsToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :shipment, :boolean
  end
end
