class AddColumnReceivedToShipments < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :received, :boolean
  end
end
