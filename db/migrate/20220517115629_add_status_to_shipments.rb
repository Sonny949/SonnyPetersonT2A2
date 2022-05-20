class AddStatusToShipments < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :status, :boolean, default: false
  end
end
